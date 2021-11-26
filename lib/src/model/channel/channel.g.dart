// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
      guildId: json['guild_id'] as String?,
      position: json['position'] as int?,
      permissionOverwrites: (json['permission_overwrites'] as List<dynamic>?)
          ?.map((e) => PermissionOverwrite.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      topic: json['topic'] as String?,
      nsfw: json['nsfw'] as bool?,
      lastMessageId: json['last_message_id'] as String?,
      bitrate: json['bitrate'] as int?,
      userLimit: json['user_limit'] as int?,
      rateLimitPerUser: json['rate_limit_per_user'] as int?,
      recipients: (json['recipients'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: json['icon'] as String?,
      ownerId: json['ownerId'] as String?,
      applicationId: json['application_id'] as String?,
      parentId: json['parent_id'] as String?,
      lastPinTimestamp: json['last_pin_timestamp'] == null
          ? null
          : DateTime.parse(json['last_pin_timestamp'] as String),
      rtcRegion: json['rtc_region'] as String?,
      videoQualityMode: $enumDecodeNullable(
          _$VideoQualityModeEnumMap, json['video_quality_mode']),
      messageCount: json['message_count'] as int?,
      memberCount: json['member_count'] as int?,
      threadMetadata: json['thread_metadata'] == null
          ? null
          : ThreadMetadata.fromJson(
              json['thread_metadata'] as Map<String, dynamic>),
      threadMember: json['threadMember'] == null
          ? null
          : ThreadMember.fromJson(json['threadMember'] as Map<String, dynamic>),
      defaultAutoArchiveDuration: $enumDecodeNullable(
          _$ThreadAutoArchiveDurationEnumMap,
          json['default_auto_archive_duration']),
      permissions: const PermissionConverterNullable()
          .fromJson(json['permissions'] as String?),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$ChannelTypeEnumMap[instance.type]);
  writeNotNull('guild_id', instance.guildId);
  writeNotNull('position', instance.position);
  writeNotNull('permission_overwrites', instance.permissionOverwrites);
  writeNotNull('name', instance.name);
  writeNotNull('topic', instance.topic);
  writeNotNull('nsfw', instance.nsfw);
  writeNotNull('last_message_id', instance.lastMessageId);
  writeNotNull('bitrate', instance.bitrate);
  writeNotNull('user_limit', instance.userLimit);
  writeNotNull('rate_limit_per_user', instance.rateLimitPerUser);
  writeNotNull('recipients', instance.recipients);
  writeNotNull('icon', instance.icon);
  writeNotNull('ownerId', instance.ownerId);
  writeNotNull('application_id', instance.applicationId);
  writeNotNull('parent_id', instance.parentId);
  writeNotNull(
      'last_pin_timestamp', instance.lastPinTimestamp?.toIso8601String());
  writeNotNull('rtc_region', instance.rtcRegion);
  writeNotNull('video_quality_mode',
      _$VideoQualityModeEnumMap[instance.videoQualityMode]);
  writeNotNull('message_count', instance.messageCount);
  writeNotNull('member_count', instance.memberCount);
  writeNotNull('thread_metadata', instance.threadMetadata);
  writeNotNull('threadMember', instance.threadMember);
  writeNotNull('default_auto_archive_duration',
      _$ThreadAutoArchiveDurationEnumMap[instance.defaultAutoArchiveDuration]);
  writeNotNull('permissions',
      const PermissionConverterNullable().toJson(instance.permissions));
  return val;
}

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

const _$VideoQualityModeEnumMap = {
  VideoQualityMode.auto: 1,
  VideoQualityMode.full: 2,
};

const _$ThreadAutoArchiveDurationEnumMap = {
  ThreadAutoArchiveDuration.oneHour: 60,
  ThreadAutoArchiveDuration.oneDay: 1440,
  ThreadAutoArchiveDuration.threeDays: 4320,
  ThreadAutoArchiveDuration.oneWeek: 10080,
};
