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

Map<String, dynamic> _$EmbedFieldToJson(EmbedField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'inline': instance.inline,
    };
