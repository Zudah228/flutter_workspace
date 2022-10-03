import 'package:flutter/material.dart';

typedef FormKey<T> = GlobalKey<FormFieldState<T>>;

typedef FormKeyStr = FormKey<String>;
typedef FormKeyInt = FormKey<int>;
typedef FormKeyBool = FormKey<bool>;
