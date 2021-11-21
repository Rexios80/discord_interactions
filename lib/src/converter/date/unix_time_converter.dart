// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Converter between unix timestamps and DateTime
class UnixTimeConverter extends JsonConverter<DateTime, int> {
  /// Constructor
  const UnixTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

/// Converter between unix timestamps and DateTime that is nullable
class UnixTimeConverterNullable extends JsonConverter<DateTime?, int?> {
  /// Constructor
  const UnixTimeConverterNullable();

  @override
  DateTime? fromJson(int? json) =>
      json == null ? null : DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int? toJson(DateTime? object) => object?.millisecondsSinceEpoch;
}
