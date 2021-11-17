// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_application_command_permissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildApplicationCommandPermissions _$GuildApplicationCommandPermissionsFromJson(
        Map<String, dynamic> json) =>
    GuildApplicationCommandPermissions(
      id: json['id'] as String,
      appplicationId: json['application_id'] as String?,
      guildId: json['guild_id'] as String?,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) =>
              ApplicationCommandPermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuildApplicationCommandPermissionsToJson(
        GuildApplicationCommandPermissions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'application_id': instance.appplicationId,
      'guild_id': instance.guildId,
      'permissions': instance.permissions,
    };
