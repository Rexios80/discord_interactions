// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_scheduled_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildScheduledEvent _$GuildScheduledEventFromJson(Map<String, dynamic> json) =>
    GuildScheduledEvent(
      id: json['id'] as String?,
      guildId: json['guild_id'] as String?,
      channelId: json['channel_id'] as String?,
      creatorId: json['creator_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      scheduledStartTime: json['scheduled_start_time'] == null
          ? null
          : DateTime.parse(json['scheduled_start_time'] as String),
      scheduledEndTime: json['scheduled_end_time'] == null
          ? null
          : DateTime.parse(json['scheduled_end_time'] as String),
      privacyLevel:
          $enumDecodeNullable(_$PrivacyLevelEnumMap, json['privacy_level']),
      status: $enumDecodeNullable(
          _$GuildScheduledEventStatusEnumMap, json['status']),
      entityType: $enumDecodeNullable(
          _$GuildScheduledEventEntityTypeEnumMap, json['entity_type']),
      entityId: json['entity_id'] as String?,
      entityMetadata: json['entity_metadata'] == null
          ? null
          : GuildScheduledEventEntityMetadata.fromJson(
              json['entity_metadata'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      userCount: json['user_count'] as int?,
    );

Map<String, dynamic> _$GuildScheduledEventToJson(GuildScheduledEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('guild_id', instance.guildId);
  writeNotNull('channel_id', instance.channelId);
  writeNotNull('creator_id', instance.creatorId);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull(
      'scheduled_start_time', instance.scheduledStartTime?.toIso8601String());
  writeNotNull(
      'scheduled_end_time', instance.scheduledEndTime?.toIso8601String());
  writeNotNull('privacy_level', _$PrivacyLevelEnumMap[instance.privacyLevel]);
  writeNotNull('status', _$GuildScheduledEventStatusEnumMap[instance.status]);
  writeNotNull('entity_type',
      _$GuildScheduledEventEntityTypeEnumMap[instance.entityType]);
  writeNotNull('entity_id', instance.entityId);
  writeNotNull('entity_metadata', instance.entityMetadata);
  writeNotNull('creator', instance.creator);
  writeNotNull('user_count', instance.userCount);
  return val;
}

const _$PrivacyLevelEnumMap = {
  PrivacyLevel.public: 1,
  PrivacyLevel.guildOnly: 2,
};

const _$GuildScheduledEventStatusEnumMap = {
  GuildScheduledEventStatus.scheduled: 1,
  GuildScheduledEventStatus.active: 2,
  GuildScheduledEventStatus.completed: 3,
  GuildScheduledEventStatus.canceled: 4,
};

const _$GuildScheduledEventEntityTypeEnumMap = {
  GuildScheduledEventEntityType.stageInstance: 1,
  GuildScheduledEventEntityType.voice: 2,
  GuildScheduledEventEntityType.external: 3,
};
