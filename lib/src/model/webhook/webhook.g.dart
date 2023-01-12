// GENERATED CODE - DO NOT MODIFY BY HAND

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

Map<String, dynamic> _$WebhookToJson(Webhook instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': _$WebhookTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guild_id', instance.guildId);
  writeNotNull('channel_id', instance.channelId);
  writeNotNull('user', instance.user);
  writeNotNull('name', instance.name);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('token', instance.token);
  val['application_id'] = instance.applicationId;
  writeNotNull('source_guild', instance.sourceGuild);
  writeNotNull('source_channel', instance.sourceChannel);
  writeNotNull('url', instance.url);
  return val;
}

const _$WebhookTypeEnumMap = {
  WebhookType.incoming: 1,
  WebhookType.channelFollower: 2,
  WebhookType.application: 3,
};
