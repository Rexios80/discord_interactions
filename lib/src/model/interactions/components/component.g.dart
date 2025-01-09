// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      minValues: (json['min_values'] as num?)?.toInt(),
      maxValues: (json['max_values'] as num?)?.toInt(),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'type': _$ComponentTypeEnumMap[instance.type]!,
      if (instance.customId case final value?) 'custom_id': value,
      if (instance.disabled case final value?) 'disabled': value,
      if (_$ButtonStyleEnumMap[instance.style] case final value?)
        'style': value,
      if (instance.label case final value?) 'label': value,
      if (instance.emoji case final value?) 'emoji': value,
      if (instance.url case final value?) 'url': value,
      if (instance.options case final value?) 'options': value,
      if (instance.placeholder case final value?) 'placeholder': value,
      if (instance.minValues case final value?) 'min_values': value,
      if (instance.maxValues case final value?) 'max_values': value,
      if (instance.components case final value?) 'components': value,
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
