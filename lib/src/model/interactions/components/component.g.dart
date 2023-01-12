// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      type: $enumDecode(_$ComponentTypeEnumMap, json['type']),
      customId: json['custom_id'] as String?,
      disabled: json['disabled'] as bool?,
      style: $enumDecodeNullable(_$ButtonStyleEnumMap, json['style']),
      label: json['label'] as String?,
      emoji: json['emoji'] == null
          ? null
          : Emoji.fromJson(json['emoji'] as Map<String, dynamic>),
      url: json['url'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => SelectOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeholder: json['placeholder'] as String?,
      minValues: json['min_values'] as int?,
      maxValues: json['max_values'] as int?,
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComponentToJson(Component instance) {
  final val = <String, dynamic>{
    'type': _$ComponentTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custom_id', instance.customId);
  writeNotNull('disabled', instance.disabled);
  writeNotNull('style', _$ButtonStyleEnumMap[instance.style]);
  writeNotNull('label', instance.label);
  writeNotNull('emoji', instance.emoji);
  writeNotNull('url', instance.url);
  writeNotNull('options', instance.options);
  writeNotNull('placeholder', instance.placeholder);
  writeNotNull('min_values', instance.minValues);
  writeNotNull('max_values', instance.maxValues);
  writeNotNull('components', instance.components);
  return val;
}

const _$ComponentTypeEnumMap = {
  ComponentType.actionRow: 1,
  ComponentType.button: 2,
  ComponentType.selectMenu: 3,
};

const _$ButtonStyleEnumMap = {
  ButtonStyle.primary: 1,
  ButtonStyle.secondary: 2,
  ButtonStyle.success: 3,
  ButtonStyle.danger: 4,
  ButtonStyle.link: 5,
};
