import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/entities/todo/todo.dart';
import 'package:flutter_workspace/common/repositories/sqflite/sqflite_repository.dart';
import 'package:flutter_workspace/common/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sqflite/sqflite.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late final Database db;
  await Future.wait([
    Firebase.initializeApp(),
    Future(() async {
      db = await openDatabase(Todo.sqflitePath);
    })
  ]);

  initializeDateFormatting('ja');

  Logger().log('Firebase App: ${Firebase.apps.first.options.projectId}');

  runApp(ProviderScope(overrides: [
    todoSqfliteProvider
        .overrideWithValue(SqfliteRepository<Todo>(db, decode: Todo.fromJson)),
  ], child: const MyApp()));
}
