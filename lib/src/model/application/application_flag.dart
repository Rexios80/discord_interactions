/// Application flags
///
/// https://discord.com/developers/docs/resources/application#application-object-application-flags
enum ApplicationFlag {
  /// GATEWAY_PRESENCE
  gatewayPresence,

  /// GATEWAY_PRESENCE_LIMITED
  gatweayPresenceLimited,

  /// GATEWAY_GUILD_MEMBERS
  gatewayGuildMembers,

  /// GATEWAY_GUILD_MEMBERS_LIMITED
  gatewayGuildMembersLimited,

  /// VERIFICATION_PENDING_GUILD_LIMIT
  verificationPendingGuildLimit,

  /// EMBEDDED
  embedded,

  /// GATEWAY_MESSAGE_CONTENT
  gatewayMessageContent,

  /// GATEWAY_MESSAGE_CONTENT_LIMITED
  gatewayMessageContentLimited,
}

/// Extension to convert flags to values
extension ApplicationFlagExtension on ApplicationFlag {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case ApplicationFlag.gatewayPresence:
        return 1 << 12;
      case ApplicationFlag.gatweayPresenceLimited:
        return 1 << 13;
      case ApplicationFlag.gatewayGuildMembers:
        return 1 << 14;
      case ApplicationFlag.gatewayGuildMembersLimited:
        return 1 << 15;
      case ApplicationFlag.verificationPendingGuildLimit:
        return 1 << 16;
      case ApplicationFlag.embedded:
        return 1 << 17;
      case ApplicationFlag.gatewayMessageContent:
        return 1 << 18;
      case ApplicationFlag.gatewayMessageContentLimited:
        return 1 << 19;
    }
  }
}
