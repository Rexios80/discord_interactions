// GENERATED CODE - DO NOT MODIFY BY HAND

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

Map<String, dynamic> _$SelectOptionToJson(SelectOption instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'description': instance.description,
      'emoji': instance.emoji,
      'default': instance.defaultSelected,
    };
