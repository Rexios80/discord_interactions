// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommand _$ApplicationCommandFromJson(Map<String, dynamic> json) =>
    ApplicationCommand(
      id: json['id'] as String?,
      type:
          $enumDecodeNullable(_$ApplicationCommandTypeEnumMap, json['type']) ??
              ApplicationCommandType.chatInput,
      applicationId: json['application_id'] as String?,
      guildId: json['guild_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              ApplicationCommandOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultPermission: json['default_permission'] as bool? ?? true,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ApplicationCommandToJson(ApplicationCommand instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ApplicationCommandTypeEnumMap[instance.type],
      'application_id': instance.applicationId,
      'guild_id': instance.guildId,
      'name': instance.name,
      'description': instance.description,
      'options': instance.options,
      'default_permission': instance.defaultPermission,
      'version': instance.version,
    };

const _$ApplicationCommandTypeEnumMap = {
  ApplicationCommandType.chatInput: 1,
  ApplicationCommandType.user: 2,
  ApplicationCommandType.message: 3,
};
