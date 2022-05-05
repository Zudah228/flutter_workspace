import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeIsoStringConverter implements JsonConverter<DateTime, String> {
  const DateTimeIsoStringConverter();
  
  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
