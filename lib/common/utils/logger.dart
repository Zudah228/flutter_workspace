import 'package:flutter/foundation.dart';

class Logger {
  Logger._();
  factory Logger() => _instance;
  static final _instance = Logger._();

  void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
