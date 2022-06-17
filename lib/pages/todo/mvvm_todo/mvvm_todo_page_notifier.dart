import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/entities/todo/todo.dart';
import 'package:flutter_workspace/common/entities/todo/todo_color_category.dart';
import 'package:flutter_workspace/pages/todo/mvvm_todo/states/mvvm_todo_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

final mvvmPageProvider =
    StateNotifierProvider.autoDispose<MvvmTodoPageNotifier, MvvmTodoPageState>(
        ((ref) => MvvmTodoPageNotifier()));

const _uuid = Uuid();

class MvvmTodoPageNotifier extends StateNotifier<MvvmTodoPageState> {
  MvvmTodoPageNotifier()
      : super(MvvmTodoPageState(
            imgPicker: ImagePicker(), textController: TextEditingController()));

  Future<void> pickImage() async {
    final pickedImage =
        await state.imgPicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }

    state = state.copyWith(imgFile: File(pickedImage.path));
  }

  void addTodo() {
    // state.imgFile を Storage に保存
    // String? url;
    // if (state.imgFile != null) {
    //   final storage = FirebaseStorage.instance;
    //   final snapshot = await storage.ref().child('path/path').putFile(state.imgFile!);
    //   url = await snapshot.ref.getDownloadURL();
    // }
    state = state.copyWith(todos: [
      ...state.todos,
      Todo(
          todoId: _uuid.v4(),
          title: state.textController.text,
          isCompleted: false,
          colorCategory: TodoColorCategory.red,
          // url: url
          createdAt: DateTime.now())
    ]);
    state.textController.clear();
  }
}
