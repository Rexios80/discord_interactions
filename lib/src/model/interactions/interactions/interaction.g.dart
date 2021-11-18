// GENERATED CODE - DO NOT MODIFY BY HAND

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
      guildId: json['guild_id'] as String,
      channelId: json['channel_id'] as String,
      member: json['member'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
      version: json['version'] as int,
      message: json['message'],
    );

Map<String, dynamic> _$InteractionToJson(Interaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'application_id': instance.applicationId,
      'type': _$InteractionTypeEnumMap[instance.type],
      'data': instance.data,
      'guild_id': instance.guildId,
      'channel_id': instance.channelId,
      'member': instance.member,
      'user': instance.user,
      'token': instance.token,
      'version': instance.version,
      'message': instance.message,
    };

const _$InteractionTypeEnumMap = {
  InteractionType.ping: 1,
  InteractionType.applicationCommand: 2,
  InteractionType.messageComponent: 3,
  InteractionType.applicationCommandAutocomplete: 4,
};
