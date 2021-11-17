import 'package:json_annotation/json_annotation.dart';

/// Channel types
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

  /// a temporary sub-channel within a GUILD_TEXT channel that is only viewable by those invited and those with the MANAGE_THREADS permission
  @JsonValue(12)
  guildPrivateThread,

  /// a voice channel for hosting events with an audience
  @JsonValue(13)
  guildStageVoice,
}
