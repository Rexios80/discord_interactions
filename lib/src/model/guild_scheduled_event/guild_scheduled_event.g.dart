// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_scheduled_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildScheduledEvent _$GuildScheduledEventFromJson(Map<String, dynamic> json) =>
    GuildScheduledEvent(
      id: json['id'] as String,
      guildId: json['guild_id'] as String,
      channelId: json['channel_id'] as String?,
      creatorId: json['creator_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      scheduledStartTime:
          DateTime.parse(json['scheduled_start_time'] as String),
      scheduledEndTime: json['scheduled_end_time'] == null
          ? null
          : DateTime.parse(json['scheduled_end_time'] as String),
      privacyLevel: $enumDecode(_$PrivacyLevelEnumMap, json['privacy_level']),
      status: $enumDecode(_$GuildScheduledEventStatusEnumMap, json['status']),
      entityType: $enumDecode(
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
  final val = <String, dynamic>{
    'id': instance.id,
    'guild_id': instance.guildId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channel_id', instance.channelId);
  writeNotNull('creator_id', instance.creatorId);
  val['name'] = instance.name;
  writeNotNull('description', instance.description);
  val['scheduled_start_time'] = instance.scheduledStartTime.toIso8601String();
  writeNotNull(
      'scheduled_end_time', instance.scheduledEndTime?.toIso8601String());
  val['privacy_level'] = _$PrivacyLevelEnumMap[instance.privacyLevel];
  val['status'] = _$GuildScheduledEventStatusEnumMap[instance.status];
  val['entity_type'] =
      _$GuildScheduledEventEntityTypeEnumMap[instance.entityType];
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
