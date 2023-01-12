// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interaction _$InteractionFromJson(Map<String, dynamic> json) => Interaction(
      id: json['id'] as String,
      applicationId: json['application_id'] as String,
      type: $enumDecode(_$InteractionTypeEnumMap, json['type']),
      data: json['data'] == null
          ? null
          : InteractionData.fromJson(json['data'] as Map<String, dynamic>),
      guildId: json['guild_id'] as String?,
      channelId: json['channel_id'] as String?,
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
      version: json['version'] as int,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InteractionToJson(Interaction instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'application_id': instance.applicationId,
    'type': _$InteractionTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('guild_id', instance.guildId);
  writeNotNull('channel_id', instance.channelId);
  writeNotNull('member', instance.member);
  writeNotNull('user', instance.user);
  val['token'] = instance.token;
  val['version'] = instance.version;
  writeNotNull('message', instance.message);
  return val;
}

const _$InteractionTypeEnumMap = {
  InteractionType.ping: 1,
  InteractionType.applicationCommand: 2,
  InteractionType.messageComponent: 3,
  InteractionType.applicationCommandAutocomplete: 4,
};
