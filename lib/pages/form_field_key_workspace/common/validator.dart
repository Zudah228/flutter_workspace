import 'package:flutter/material.dart';

@immutable
class ValidationErrorMessages {
  const ValidationErrorMessages({
    this.requiredMessage = '必須入力です',
    this.formatErrorMessage = '正しいフォーマットで入力してください',
    this.emailErrorMessage,
  });
  final String requiredMessage;
  final String formatErrorMessage;
  final String? emailErrorMessage;
}

// TODO: パスワードの強度設定をできるようにする
class Validator {
  Validator._();
  factory Validator() => _instance;
  static final _instance = Validator._();

  // 変更可能
  ValidationErrorMessages messages = const ValidationErrorMessages();

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) return messages.requiredMessage;
    return null;
  }

  String? emailValidator(String? value) {
    final message = messages.emailErrorMessage == null
        ? messages.requiredMessage
        : messages.formatErrorMessage;

    if (value == null || _isEmailAddress(value)) {
      return message;
    }
    return null;
  }

  bool _isEmailAddress(String value) {
    return RegExp(
      r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$',
    ).hasMatch(value);
  }
}
