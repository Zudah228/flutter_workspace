
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/common/entities/todo/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'mvvm_todo_page_state.freezed.dart';


@freezed
class MvvmTodoPageState with _$MvvmTodoPageState {
  factory MvvmTodoPageState({
    required TextEditingController textController,
    required ImagePicker imgPicker,
    File? imgFile,
    @Default([]) List<Todo> todos,
  }) = _MvvmTodoPageState;
	
}
