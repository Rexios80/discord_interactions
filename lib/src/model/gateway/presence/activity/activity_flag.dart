/// Activity flags
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-flags
enum ActivityFlag {
  /// instance
  instance,

  /// join
  join,

  /// spectate
  spectate,

  /// join request
  joinRequest,

  /// sync
  sync,

  /// play
  play,

  /// party privacy friends
  partyPrivacyFriends,

  /// party privacy voice channel
  partyPrivacyVoiceChannel,

  /// embedded
  embedded,
}

/// Extension to convert flags to values
extension ActivityFlagExtension on ActivityFlag {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case ActivityFlag.instance:
        return 1 << 0;
      case ActivityFlag.join:
        return 1 << 1;
      case ActivityFlag.spectate:
        return 1 << 2;
      case ActivityFlag.joinRequest:
        return 1 << 3;
      case ActivityFlag.sync:
        return 1 << 4;
      case ActivityFlag.play:
        return 1 << 5;
      case ActivityFlag.partyPrivacyFriends:
        return 1 << 6;
      case ActivityFlag.partyPrivacyVoiceChannel:
        return 1 << 7;
      case ActivityFlag.embedded:
        return 1 << 8;
    }
  }
}
