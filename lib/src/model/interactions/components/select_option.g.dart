// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'select_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectOption _$SelectOptionFromJson(Map<String, dynamic> json) => SelectOption(
      label: json['label'] as String,
      value: json['value'] as String,
      description: json['description'] as String?,
      emoji: json['emoji'] == null
          ? null
          : Emoji.fromJson(json['emoji'] as Map<String, dynamic>),
      defaultSelected: json['default'] as bool?,
    );

Map<String, dynamic> _$SelectOptionToJson(SelectOption instance) {
  final val = <String, dynamic>{
    'label': instance.label,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('emoji', instance.emoji);
  writeNotNull('default', instance.defaultSelected);
  return val;
}
