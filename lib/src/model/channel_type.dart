// TODO: Json values
/// Channel types
enum ChannelType {
  /// a text channel within a server
  guildText,

  /// a direct message between users
  dm,

  /// a voice channel within a server
  guildVoice,

  /// a direct message between multiple users
  groupDm,

  /// an organizational category that contains up to 50 channels
  guildCategory,

  /// a channel that users can follow and crosspost into their own server
  guildNews,

  /// a channel in which game developers can sell their game on Discord
  guildStore,

  /// a temporary sub-channel within a GUILD_NEWS channel
  guildNewsThread,

  /// a temporary sub-channel within a GUILD_TEXT channel
  guildPublicThread,

  /// a temporary sub-channel within a GUILD_TEXT channel that is only viewable by those invited and those with the MANAGE_THREADS permission
  guildPrivateThread,

  /// a voice channel for hosting events with an audience
  guildStageVoice,
}
