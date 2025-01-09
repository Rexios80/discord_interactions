// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'interaction_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionData _$InteractionDataFromJson(Map<String, dynamic> json) =>
    InteractionData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: $enumDecodeNullable(_$ApplicationCommandTypeEnumMap, json['type']),
      resolved: json['resolved'] == null
          ? null
          : ResolvedData.fromJson(json['resolved'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ApplicationCommandInteractionDataOption.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      customId: json['custom_id'] as String?,
      componentType:
          $enumDecodeNullable(_$ComponentTypeEnumMap, json['component_type']),
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      targetId: json['target_id'] as String?,
    );

Map<String, dynamic> _$InteractionDataToJson(InteractionData instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (_$ApplicationCommandTypeEnumMap[instance.type] case final value?)
        'type': value,
      if (instance.resolved case final value?) 'resolved': value,
      if (instance.options case final value?) 'options': value,
      if (instance.customId case final value?) 'custom_id': value,
      if (_$ComponentTypeEnumMap[instance.componentType] case final value?)
        'component_type': value,
      if (instance.values case final value?) 'values': value,
      if (instance.targetId case final value?) 'target_id': value,
    };

const _$ApplicationCommandTypeEnumMap = {
  ApplicationCommandType.chatInput: 1,
  ApplicationCommandType.user: 2,
  ApplicationCommandType.message: 3,
};

const _$ComponentTypeEnumMap = {
  ComponentType.actionRow: 1,
  ComponentType.button: 2,
  ComponentType.selectMenu: 3,
};
