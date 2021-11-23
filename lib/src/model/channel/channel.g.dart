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
          ?.map((e) => Overwrite.fromJson(e as Map<String, dynamic>))
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
      defaultAutoArchiveDuration: json['default_auto_archive_duration'] as int?,
      permissions: const PermissionConverterNullable()
          .fromJson(json['permissions'] as String?),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ChannelTypeEnumMap[instance.type],
      'guild_id': instance.guildId,
      'position': instance.position,
      'permission_overwrites': instance.permissionOverwrites,
      'name': instance.name,
      'topic': instance.topic,
      'nsfw': instance.nsfw,
      'last_message_id': instance.lastMessageId,
      'bitrate': instance.bitrate,
      'user_limit': instance.userLimit,
      'rate_limit_per_user': instance.rateLimitPerUser,
      'recipients': instance.recipients,
      'icon': instance.icon,
      'ownerId': instance.ownerId,
      'application_id': instance.applicationId,
      'parent_id': instance.parentId,
      'last_pin_timestamp': instance.lastPinTimestamp?.toIso8601String(),
      'rtc_region': instance.rtcRegion,
      'video_quality_mode':
          _$VideoQualityModeEnumMap[instance.videoQualityMode],
      'message_count': instance.messageCount,
      'member_count': instance.memberCount,
      'thread_metadata': instance.threadMetadata,
      'threadMember': instance.threadMember,
      'default_auto_archive_duration': instance.defaultAutoArchiveDuration,
      'permissions':
          const PermissionConverterNullable().toJson(instance.permissions),
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
