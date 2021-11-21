/// System Channel flags
///
/// https://discord.com/developers/docs/resources/guild#guild-object-system-channel-flags
enum SystemChannelFlag {
  /// Suppress member join notifications
  suppressJoinNotifications,

  /// Suppress server boost notifications
  suppressPremiumSubscriptions,

  /// Suppress server setup tips
  suppressGuildReminderNotifications,

  /// Hide member join sticker reply buttons
  suppressJoinNotificationReplies,
}

/// Extension to convert flags to values
extension SystemChannelFlagExtension on SystemChannelFlag {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case SystemChannelFlag.suppressJoinNotifications:
        return 1 << 0;
      case SystemChannelFlag.suppressPremiumSubscriptions:
        return 1 << 1;
      case SystemChannelFlag.suppressGuildReminderNotifications:
        return 1 << 2;
      case SystemChannelFlag.suppressJoinNotificationReplies:
        return 1 << 3;
    }
  }
}
