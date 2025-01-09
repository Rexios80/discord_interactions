// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'permission_overwrite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionOverwrite _$PermissionOverwriteFromJson(Map<String, dynamic> json) =>
    PermissionOverwrite(
      id: json['id'] as String,
      type: $enumDecode(_$PermissionOverwriteTypeEnumMap, json['type']),
      allow: const PermissionConverter().fromJson(json['allow'] as String),
      deny: const PermissionConverter().fromJson(json['deny'] as String),
    );

Map<String, dynamic> _$PermissionOverwriteToJson(
        PermissionOverwrite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PermissionOverwriteTypeEnumMap[instance.type]!,
      'allow': const PermissionConverter().toJson(instance.allow),
      'deny': const PermissionConverter().toJson(instance.deny),
    };

const _$PermissionOverwriteTypeEnumMap = {
  PermissionOverwriteType.role: 0,
  PermissionOverwriteType.member: 1,
};
