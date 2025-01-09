// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'application_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommand _$ApplicationCommandFromJson(Map<String, dynamic> json) =>
    ApplicationCommand(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$ApplicationCommandTypeEnumMap, json['type']),
      applicationId: json['application_id'] as String?,
      guildId: json['guild_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              ApplicationCommandOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultPermission: json['default_permission'] as bool?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ApplicationCommandToJson(ApplicationCommand instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (_$ApplicationCommandTypeEnumMap[instance.type] case final value?)
        'type': value,
      if (instance.applicationId case final value?) 'application_id': value,
      if (instance.guildId case final value?) 'guild_id': value,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.options case final value?) 'options': value,
      if (instance.defaultPermission case final value?)
        'default_permission': value,
      if (instance.version case final value?) 'version': value,
    };

const _$ApplicationCommandTypeEnumMap = {
  ApplicationCommandType.chatInput: 1,
  ApplicationCommandType.user: 2,
  ApplicationCommandType.message: 3,
};
