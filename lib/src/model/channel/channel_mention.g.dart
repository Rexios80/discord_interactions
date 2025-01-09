// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'channel_mention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMention _$ChannelMentionFromJson(Map<String, dynamic> json) =>
    ChannelMention(
      id: json['id'] as String,
      guildId: json['guild_id'] as String,
      type: $enumDecode(_$ChannelTypeEnumMap, json['type']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ChannelMentionToJson(ChannelMention instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guild_id': instance.guildId,
      'type': _$ChannelTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

const _$ChannelTypeEnumMap = {
  ChannelType.guildText: 0,
  ChannelType.dm: 1,
  ChannelType.guildVoice: 2,
  ChannelType.groupDm: 3,
  ChannelType.guildCategory: 4,
  ChannelType.guildNews: 5,
  ChannelType.guildStore: 6,
  ChannelType.guildNewsThread: 10,
  ChannelType.guildPublicThread: 11,
  ChannelType.guildPrivateThread: 12,
  ChannelType.guildStageVoice: 13,
};
