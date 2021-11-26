// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedField _$EmbedFieldFromJson(Map<String, dynamic> json) => EmbedField(
      name: json['name'] as String,
      value: json['value'] as String,
      inline: json['inline'] as bool?,
    );

Map<String, dynamic> _$EmbedFieldToJson(EmbedField instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inline', instance.inline);
  return val;
}
