// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Converter between ISO8601 strings and DateTime
class ISO8601Converter extends JsonConverter<DateTime, String> {
  /// Constructor
  const ISO8601Converter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}

/// Converter between ISO8601 strings and DateTime that is nullable
class ISO8601ConverterNullable extends JsonConverter<DateTime?, String?> {
  /// Constructor
  const ISO8601ConverterNullable();

  @override
  DateTime? fromJson(String? json) =>
      json == null ? null : DateTime.parse(json);

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();
}
