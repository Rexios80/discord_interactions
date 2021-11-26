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
    GuildApplicationCommandPermissions instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('application_id', instance.appplicationId);
  writeNotNull('guild_id', instance.guildId);
  val['permissions'] = instance.permissions;
  return val;
}
