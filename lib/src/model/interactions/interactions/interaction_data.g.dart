// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$InteractionDataToJson(InteractionData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', _$ApplicationCommandTypeEnumMap[instance.type]);
  writeNotNull('resolved', instance.resolved);
  writeNotNull('options', instance.options);
  writeNotNull('custom_id', instance.customId);
  writeNotNull(
      'component_type', _$ComponentTypeEnumMap[instance.componentType]);
  writeNotNull('values', instance.values);
  writeNotNull('target_id', instance.targetId);
  return val;
}

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
