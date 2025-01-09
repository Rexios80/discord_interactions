// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      userCount: (json['user_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GuildScheduledEventToJson(
        GuildScheduledEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guild_id': instance.guildId,
      if (instance.channelId case final value?) 'channel_id': value,
      if (instance.creatorId case final value?) 'creator_id': value,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      'scheduled_start_time': instance.scheduledStartTime.toIso8601String(),
      if (instance.scheduledEndTime?.toIso8601String() case final value?)
        'scheduled_end_time': value,
      'privacy_level': _$PrivacyLevelEnumMap[instance.privacyLevel]!,
      'status': _$GuildScheduledEventStatusEnumMap[instance.status]!,
      'entity_type':
          _$GuildScheduledEventEntityTypeEnumMap[instance.entityType]!,
      if (instance.entityId case final value?) 'entity_id': value,
      if (instance.entityMetadata case final value?) 'entity_metadata': value,
      if (instance.creator case final value?) 'creator': value,
      if (instance.userCount case final value?) 'user_count': value,
    };

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
