// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageInstance _$StageInstanceFromJson(Map<String, dynamic> json) =>
    StageInstance(
      id: json['id'] as String,
      guildId: json['guild_id'] as String,
      channelId: json['channel_id'] as String,
      topic: json['topic'] as String,
      privacyLevel: $enumDecode(
          _$StageInstancePrivacyLevelEnumMap, json['privacy_level']),
      discoveryDisabled: json['discovery_disabled'] as bool,
    );

Map<String, dynamic> _$StageInstanceToJson(StageInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guild_id': instance.guildId,
      'channel_id': instance.channelId,
      'topic': instance.topic,
      'privacy_level':
          _$StageInstancePrivacyLevelEnumMap[instance.privacyLevel],
      'discovery_disabled': instance.discoveryDisabled,
    };

const _$StageInstancePrivacyLevelEnumMap = {
  StageInstancePrivacyLevel.public: 1,
  StageInstancePrivacyLevel.guildOnly: 2,
};
