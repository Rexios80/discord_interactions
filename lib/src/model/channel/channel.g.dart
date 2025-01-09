// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as String,
      type: $enumDecode(_$ChannelTypeEnumMap, json['type']),
      guildId: json['guild_id'] as String?,
      position: (json['position'] as num?)?.toInt(),
      permissionOverwrites: (json['permission_overwrites'] as List<dynamic>?)
          ?.map((e) => PermissionOverwrite.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      topic: json['topic'] as String?,
      nsfw: json['nsfw'] as bool?,
      lastMessageId: json['last_message_id'] as String?,
      bitrate: (json['bitrate'] as num?)?.toInt(),
      userLimit: (json['user_limit'] as num?)?.toInt(),
      rateLimitPerUser: (json['rate_limit_per_user'] as num?)?.toInt(),
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
      messageCount: (json['message_count'] as num?)?.toInt(),
      memberCount: (json['member_count'] as num?)?.toInt(),
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

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ChannelTypeEnumMap[instance.type]!,
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.position case final value?) 'position': value,
      if (instance.permissionOverwrites case final value?)
        'permission_overwrites': value,
      if (instance.name case final value?) 'name': value,
      if (instance.topic case final value?) 'topic': value,
      if (instance.nsfw case final value?) 'nsfw': value,
      if (instance.lastMessageId case final value?) 'last_message_id': value,
      if (instance.bitrate case final value?) 'bitrate': value,
      if (instance.userLimit case final value?) 'user_limit': value,
      if (instance.rateLimitPerUser case final value?)
        'rate_limit_per_user': value,
      if (instance.recipients case final value?) 'recipients': value,
      if (instance.icon case final value?) 'icon': value,
      if (instance.ownerId case final value?) 'ownerId': value,
      if (instance.applicationId case final value?) 'application_id': value,
      if (instance.parentId case final value?) 'parent_id': value,
      if (instance.lastPinTimestamp?.toIso8601String() case final value?)
        'last_pin_timestamp': value,
      if (instance.rtcRegion case final value?) 'rtc_region': value,
      if (_$VideoQualityModeEnumMap[instance.videoQualityMode]
          case final value?)
        'video_quality_mode': value,
      if (instance.messageCount case final value?) 'message_count': value,
      if (instance.memberCount case final value?) 'member_count': value,
      if (instance.threadMetadata case final value?) 'thread_metadata': value,
      if (instance.threadMember case final value?) 'threadMember': value,
      if (_$ThreadAutoArchiveDurationEnumMap[
              instance.defaultAutoArchiveDuration]
          case final value?)
        'default_auto_archive_duration': value,
      if (const PermissionConverterNullable().toJson(instance.permissions)
          case final value?)
        'permissions': value,
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
