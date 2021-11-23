// GENERATED CODE - DO NOT MODIFY BY HAND

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
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => SelectOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetId: json['target_id'] as String?,
    );

Map<String, dynamic> _$InteractionDataToJson(InteractionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ApplicationCommandTypeEnumMap[instance.type],
      'resolved': instance.resolved,
      'options': instance.options,
      'custom_id': instance.customId,
      'component_type': _$ComponentTypeEnumMap[instance.componentType],
      'values': instance.values,
      'target_id': instance.targetId,
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
