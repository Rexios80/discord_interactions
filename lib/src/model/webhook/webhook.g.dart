// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'webhook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Webhook _$WebhookFromJson(Map<String, dynamic> json) => Webhook(
      id: json['id'] as String,
      type: $enumDecode(_$WebhookTypeEnumMap, json['type']),
      guildId: json['guild_id'] as String?,
      channelId: json['channel_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      token: json['token'] as String?,
      applicationId: json['application_id'] as String,
      sourceGuild: json['source_guild'] == null
          ? null
          : Guild.fromJson(json['source_guild'] as Map<String, dynamic>),
      sourceChannel: json['source_channel'] == null
          ? null
          : Channel.fromJson(json['source_channel'] as Map<String, dynamic>),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$WebhookToJson(Webhook instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$WebhookTypeEnumMap[instance.type]!,
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.channelId case final value?) 'channel_id': value,
      if (instance.user case final value?) 'user': value,
      if (instance.name case final value?) 'name': value,
      if (instance.avatar case final value?) 'avatar': value,
      if (instance.token case final value?) 'token': value,
      'application_id': instance.applicationId,
      if (instance.sourceGuild case final value?) 'source_guild': value,
      if (instance.sourceChannel case final value?) 'source_channel': value,
      if (instance.url case final value?) 'url': value,
    };

const _$WebhookTypeEnumMap = {
  WebhookType.incoming: 1,
  WebhookType.channelFollower: 2,
  WebhookType.application: 3,
};
