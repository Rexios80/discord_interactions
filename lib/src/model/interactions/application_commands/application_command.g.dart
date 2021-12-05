// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommand _$ApplicationCommandFromJson(Map<String, dynamic> json) =>
    ApplicationCommand(
      id: json['id'] as String? ?? '',
      type: $enumDecodeNullable(_$ApplicationCommandTypeEnumMap, json['type']),
      applicationId: json['application_id'] as String? ?? '',
      guildId: json['guild_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              ApplicationCommandOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultPermission: json['default_permission'] as bool?,
      version: json['version'] as String? ?? '',
    );

Map<String, dynamic> _$ApplicationCommandToJson(ApplicationCommand instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$ApplicationCommandTypeEnumMap[instance.type]);
  val['application_id'] = instance.applicationId;
  writeNotNull('guild_id', instance.guildId);
  val['name'] = instance.name;
  val['description'] = instance.description;
  writeNotNull('options', instance.options);
  writeNotNull('default_permission', instance.defaultPermission);
  val['version'] = instance.version;
  return val;
}

const _$ApplicationCommandTypeEnumMap = {
  ApplicationCommandType.chatInput: 1,
  ApplicationCommandType.user: 2,
  ApplicationCommandType.message: 3,
};
