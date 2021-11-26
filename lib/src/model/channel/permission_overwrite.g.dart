// GENERATED CODE - DO NOT MODIFY BY HAND

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

Map<String, dynamic> _$PermissionOverwriteToJson(PermissionOverwrite instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': _$PermissionOverwriteTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allow', const PermissionConverter().toJson(instance.allow));
  writeNotNull('deny', const PermissionConverter().toJson(instance.deny));
  return val;
}

const _$PermissionOverwriteTypeEnumMap = {
  PermissionOverwriteType.role: 0,
  PermissionOverwriteType.member: 1,
};
