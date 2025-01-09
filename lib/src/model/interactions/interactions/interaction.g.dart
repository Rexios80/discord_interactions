// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      version: (json['version'] as num).toInt(),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InteractionToJson(Interaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'application_id': instance.applicationId,
      'type': _$InteractionTypeEnumMap[instance.type]!,
      if (instance.data case final value?) 'data': value,
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.channelId case final value?) 'channel_id': value,
      if (instance.member case final value?) 'member': value,
      if (instance.user case final value?) 'user': value,
      'token': instance.token,
      'version': instance.version,
      if (instance.message case final value?) 'message': value,
    };

const _$InteractionTypeEnumMap = {
  InteractionType.ping: 1,
  InteractionType.applicationCommand: 2,
  InteractionType.messageComponent: 3,
  InteractionType.applicationCommandAutocomplete: 4,
};
