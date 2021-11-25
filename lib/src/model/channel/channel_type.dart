// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Channel types
///
/// https://discord.com/developers/docs/resources/channel#channel-object-channel-types
enum ChannelType {
  /// a text channel within a server
  @JsonValue(0)
  guildText,

  /// a direct message between users
  @JsonValue(1)
  dm,

  /// a voice channel within a server
  @JsonValue(2)
  guildVoice,

  /// a direct message between multiple users
  @JsonValue(3)
  groupDm,

  /// an organizational category that contains up to 50 channels
  @JsonValue(4)
  guildCategory,

  /// a channel that users can follow and crosspost into their own server
  @JsonValue(5)
  guildNews,

  /// a channel in which game developers can sell their game on Discord
  @JsonValue(6)
  guildStore,

  /// a temporary sub-channel within a GUILD_NEWS channel
  @JsonValue(10)
  guildNewsThread,

  /// a temporary sub-channel within a GUILD_TEXT channel
  @JsonValue(11)
  guildPublicThread,

  /// a temporary sub-channel within a GUILD_TEXT channel that is only viewable
  /// by those invited and those with the MANAGE_THREADS permission
  @JsonValue(12)
  guildPrivateThread,

  /// a voice channel for hosting events with an audience
  @JsonValue(13)
  guildStageVoice,
}

/// Extension on [ChannelType]
extension ChannelTypeExtension on ChannelType {
  static const _enumMap = <ChannelType, int>{
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

  /// Get the value of the enum
  int get value => _enumMap[this]!;

  /// Create a [ChannelType] from a value
  static ChannelType fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
