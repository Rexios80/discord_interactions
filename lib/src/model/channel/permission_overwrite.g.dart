// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_overwrite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionOverwrite _$PermissionOverwriteFromJson(Map<String, dynamic> json) =>
    PermissionOverwrite(
      id: json['id'] as String,
      type: $enumDecode(_$OverwriteTypeEnumMap, json['type']),
      allow: const PermissionConverter().fromJson(json['allow'] as String),
      deny: const PermissionConverter().fromJson(json['deny'] as String),
    );

Map<String, dynamic> _$PermissionOverwriteToJson(
        PermissionOverwrite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$OverwriteTypeEnumMap[instance.type],
      'allow': const PermissionConverter().toJson(instance.allow),
      'deny': const PermissionConverter().toJson(instance.deny),
    };

const _$OverwriteTypeEnumMap = {
  OverwriteType.role: 0,
  OverwriteType.member: 1,
};