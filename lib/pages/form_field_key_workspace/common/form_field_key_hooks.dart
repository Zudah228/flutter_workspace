import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

GlobalKey<FormFieldState<String>> useFormFieldKey() {
  return useState(GlobalKey<FormFieldState<String>>()).value;
}
