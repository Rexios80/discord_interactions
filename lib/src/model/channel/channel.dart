// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/converter/iso8601_converter.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

part 'channel.g.dart';

/// Channel structure
/// 
/// Represents a guild or DM channel within Discord.
/// 
/// https://discord.com/developers/docs/resources/channel#channel-object-channel-structure
@JsonSerializable()
class Channel {
  /// the id of this channel
  final String id;

  /// the type of channel
  final ChannelType type;

  /// the id of the guild (may be missing for some channel objects received
  /// over gateway guild dispatches)
  @JsonKey(name: 'guild_id')
  final String guildId;

  /// sorting position of the channel
  final int? position;

  /// explicit permission overwrites for members and roles
  @JsonKey(name: 'permission_overwrites')
  final List<Overwrite> permissionOverwrites;

  /// the name of the channel (1-100 characters)
  final String? name;

  /// the channel topic (0-1024 characters)
  final String? topic;

  /// whether the channel is nsfw
  final bool? nsfw;

  /// the id of the last message sent in this channel (may not point to an existing or valid message)
  @JsonKey(name: 'last_message_id')
  final String? lastMessageId;

  /// the bitrate (in bits) of the voice channel
  final int? bitrate;

  /// the user limit of the voice channel
  @JsonKey(name: 'user_limit')
  final int? userLimit;

  /// amount of seconds a user has to wait before sending another message
  /// (0-21600); bots, as well as users with the permission manage_messages or
  /// manage_channel, are unaffected
  ///
  /// rate_limit_per_user also applies to thread creation. Users can send one
  /// message and create one thread during each rate_limit_per_user interval.
  @JsonKey(name: 'rate_limit_per_user')
  final int? rateLimitPerUser;

  /// the recipients of the DM
  final List<User>? recipients;

  /// icon hash
  final String? icon;

  /// id of the creator of the group DM or thread
  final String? ownerId;

  /// application id of the group DM creator if it is bot-created
  @JsonKey(name: 'application_id')
  final String? applicationId;

  /// for guild channels: id of the parent category for a channel (each parent
  /// category can contain up to 50 channels), for threads: id of the text
  /// channel this thread was created
  @JsonKey(name: 'parent_id')
  final String? parentId;

  /// when the last pinned message was pinned. This may be null in events such
  /// as GUILD_CREATE when a message is not pinned.
  @ISO8601ConverterNullable()
  @JsonKey(name: 'last_pin_timestamp')
  final DateTime? lastPinTimestamp;

  /// voice region id for the voice channel, automatic when set to null
  @JsonKey(name: 'rtc_region')
  final String? rtcRegion;

  /// the camera video quality mode of the voice channel, 1 when not present
  @JsonKey(name: 'video_quality_mode')
  final VideoQualityMode? videoQualityMode;

  /// an approximate count of messages in a thread, stops counting at 50
  @JsonKey(name: 'message_count')
  final int? messageCount;

  /// an approximate count of users in a thread, stops counting at 50
  @JsonKey(name: 'member_count')
  final int? memberCount;

  /// thread-specific fields not needed by other channels
  @JsonKey(name: 'thread_metadata')
  final ThreadMetadata? threadMetadata;

  /// thread member object for the current user, if they have joined the thread,
  /// only included on certain API endpoints
  final ThreadMember? threadMember;

  /// default duration that the clients (not the API) will use for newly created
  /// threads, in minutes, to automatically archive the thread after recent
  /// activity, can be set to: 60, 1440, 4320, 10080
  @JsonKey(name: 'default_auto_archive_duration')
  final int? defaultAutoArchiveDuration;

  /// computed permissions for the invoking user in the channel, including
  /// overwrites, only included when part of the resolved data received on a
  /// slash command interaction
  final String? permissions;

  /// Constructor
  Channel({
    required this.id,
    required this.type,
    required this.guildId,
    this.position,
    required this.permissionOverwrites,
    this.name,
    this.topic,
    this.nsfw,
    this.lastMessageId,
    this.bitrate,
    this.userLimit,
    this.rateLimitPerUser,
    this.recipients,
    this.icon,
    this.ownerId,
    this.applicationId,
    this.parentId,
    this.lastPinTimestamp,
    this.rtcRegion,
    this.videoQualityMode,
    this.messageCount,
    this.memberCount,
    this.threadMetadata,
    this.threadMember,
    this.defaultAutoArchiveDuration,
    this.permissions,
  });

  /// From json
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
