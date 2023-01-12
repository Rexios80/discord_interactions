// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_command_permissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommandPermissions _$ApplicationCommandPermissionsFromJson(
        Map<String, dynamic> json) =>
    ApplicationCommandPermissions(
      id: json['id'] as String,
      type:
          $enumDecode(_$ApplicationCommandPermissionTypeEnumMap, json['type']),
      permission: json['permission'] as bool,
    );

Map<String, dynamic> _$ApplicationCommandPermissionsToJson(
        ApplicationCommandPermissions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ApplicationCommandPermissionTypeEnumMap[instance.type]!,
      'permission': instance.permission,
    };

const _$ApplicationCommandPermissionTypeEnumMap = {
  ApplicationCommandPermissionType.role: 1,
  ApplicationCommandPermissionType.user: 2,
};
