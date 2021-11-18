// GENERATED CODE - DO NOT MODIFY BY HAND

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

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'type': _$ComponentTypeEnumMap[instance.type],
      'custom_id': instance.customId,
      'disabled': instance.disabled,
      'style': _$ButtonStyleEnumMap[instance.style],
      'label': instance.label,
      'emoji': instance.emoji,
      'url': instance.url,
      'options': instance.options,
      'placeholder': instance.placeholder,
      'min_values': instance.minValues,
      'max_values': instance.maxValues,
      'components': instance.components,
    };

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
