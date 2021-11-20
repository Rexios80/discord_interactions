// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'embed_field.g.dart';

/// Embed Field structure
/// 
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-field-structure
@JsonSerializable()
class EmbedField {
  /// name of the field
  final String name;

  /// value of the field
  final String value;

  /// whether or not this field should display inline
  final bool? inline;

  /// Constructor
  EmbedField({
    required this.name,
    required this.value,
    this.inline,
  });

  /// From json
  factory EmbedField.fromJson(Map<String, dynamic> json) =>
      _$EmbedFieldFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedFieldToJson(this);
}
