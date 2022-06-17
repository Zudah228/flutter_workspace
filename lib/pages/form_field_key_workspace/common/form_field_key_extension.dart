import 'package:flutter/material.dart';

extension FormFieldKeyExtension on GlobalKey<FormFieldState<String>> {
  String get currentValue => currentState?.value ?? '';
  /// Returns true if there were no errors.
  bool validate() => currentState?.validate() ?? false;
  void clear() => currentState?.didChange('');
  void insert(String text) => currentState?.didChange(text);
}
