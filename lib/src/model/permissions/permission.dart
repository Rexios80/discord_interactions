/// Bitwise Permission Flags
///
/// https://discord.com/developers/docs/topics/permissions#permissions-bitwise-permission-flags
enum Permission {
  /// 0x0000000001 (1 << 0)
  ///
  /// Allows creation of instant invites
  ///
  /// Channel types: T, V, S
  createInstantInvite,

  /// 0x0000000002 (1 << 1)
  ///
  /// Allows kicking members
  kickMembers,

  /// 0x0000000004 (1 << 2)
  ///
  /// Allows banning members
  banMembers,

  /// 0x0000000008 (1 << 3)
  ///
  /// Allows all permissions and bypasses channel permission overwrites
  administrator,

  /// 0x0000000010 (1 << 4)
  ///
  /// Allows management and editing of channels
  ///
  /// Channel types: T, V, S
  manageChannels,

  /// 0x0000000020 (1 << 5)
  ///
  /// Allows management and editing of the guild
  manageGuild,

  /// 0x0000000040 (1 << 6)
  ///
  /// Allows for the addition of reactions to messages
  ///
  /// Channel types: T
  addReactions,

  /// 0x0000000080 (1 << 7)
  ///
  /// Allows for viewing of audit logs
  viewAuditLog,

  /// 0x0000000100 (1 << 8)
  ///
  /// Allows for using priority speaker in a voice channel
  ///
  /// Channel types: V
  prioritySpeaker,

  /// 0x0000000200 (1 << 9)
  ///
  /// Allows the user to go live
  ///
  /// Channel types: V
  stream,

  /// 0x0000000400 (1 << 10)
  ///
  /// Allows guild members to view a channel, which includes reading
  /// messages in text channels
  ///
  /// Channel types: T, V, S
  viewChannel,

  /// 0x0000000800 (1 << 11)
  ///
  /// Allows for sending messages in a channel (does not allow sending messages in threads)
  ///
  /// Channel types: T
  sendMessages,

  /// 0x0000001000 (1 << 12)
  ///
  /// Allows for sending of /tts messages
  ///
  /// Channel types: T
  sendTtsMessages,

  /// 0x0000002000 (1 << 13)
  ///
  /// Allows for deletion of other users messages
  ///
  /// Channel types: T
  manageMessages,

  /// 0x0000004000 (1 << 14)
  ///
  /// Links sent by users with this permission will be auto-embedded
  ///
  /// Channel types: T
  embedLinks,

  /// 0x0000008000 (1 << 15)
  ///
  /// Allows for uploading images and files
  ///
  /// Channel types: T
  attachFiles,

  /// 0x0000010000 (1 << 16)
  ///
  /// Allows for reading of message history
  ///
  /// Channel types: T
  readMessageHistory,

  /// 0x0000020000 (1 << 17)
  ///
  /// Allows for using the @everyone tag to notify all users in a channel, and
  /// the @here tag to notify all online users in a channel
  ///
  /// Channel types: T
  mentionEveryone,

  /// 0x0000040000 (1 << 18)
  ///
  /// Allows the usage of custom emojis from other servers
  ///
  /// Channel types: T
  useExternalEmojis,

  /// 0x0000080000 (1 << 19)
  ///
  /// Allows for viewing guild insights
  viewGuildInsights,

  /// 0x0000100000 (1 << 20)
  ///
  /// Allows for joining of a voice channel
  ///
  /// Channel types: V, S
  connect,

  /// 0x0000200000 (1 << 21)
  ///
  /// Allows for speaking in a voice channel
  ///
  /// Channel types: V
  speak,

  /// 0x0000400000 (1 << 22)
  ///
  /// Allows for muting members in a voice channel
  ///
  /// Channel types: V, S
  muteMembers,

  /// 0x0000800000 (1 << 23)
  ///
  /// Allows for deafening of members in a voice channel
  ///
  /// Channel types: V, S
  deafenMembers,

  /// 0x0001000000 (1 << 24)
  ///
  /// Allows for moving of members between voice channels
  ///
  /// Channel types: V, S
  moveMembers,

  /// 0x0002000000 (1 << 25)
  ///
  /// Allows for using voice-activity-detection in a
  /// voice channel
  ///
  /// Channel types: V
  useVad,

  /// 0x0004000000 (1 << 26)
  ///
  /// Allows for modification of own nickname
  changeNickname,

  /// 0x0008000000 (1 << 27)
  ///
  /// Allows for modification of other users nicknames
  manageNicknames,

  /// 0x0010000000 (1 << 28)
  ///
  /// Allows management and editing of roles
  ///
  /// Channel types: T, V, S
  manageRoles,

  /// 0x0020000000 (1 << 29)
  ///
  /// Allows management and editing of webhooks
  ///
  /// Channel types: T
  manageWebhooks,

  /// 0x0040000000 (1 << 30)
  ///
  /// Allows management and editing of emojis and stickers
  manageEmojisAndStickers,

  /// 0x0080000000 (1 << 31)
  ///
  /// Allows members to use application commands, including slash commands and
  /// context menu commands.
  ///
  /// Channel types: T
  useApplicationCommands,

  /// 0x0100000000 (1 << 32)
  ///
  /// Allows for requesting to speak in stage channels. (This permission is
  /// under active development and may be changed or removed.)
  ///
  /// Channel types: S
  requestToSpeak,

  /// 0x0200000000 (1 << 33)
  ///
  /// Allows for creating, editing, and deleting scheduled events
  ///
  /// Channel types: V, S
  manageEvents,

  /// 0x0400000000 (1 << 34)
  ///
  /// Allows for deleting and archiving threads, and viewing all private threads
  ///
  /// Channel types: T
  manageThreads,

  /// 0x0800000000 (1 << 35)
  ///
  /// Allows for creating threads
  ///
  /// Channel types: T
  createPublicThreads,

  /// 0x1000000000 (1 << 36)
  ///
  /// Allows for creating private threads
  ///
  /// Channel types: T
  createPrivateThreads,

  /// 0x2000000000 (1 << 37)
  ///
  /// Allows the usage of custom stickers from other servers
  ///
  /// Channel types: T
  useExternalStickers,

  /// 0x4000000000 (1 << 38)
  ///
  /// Allows for sending messages in threads
  ///
  /// Channel types: T
  sendMessagesInThreads,

  /// 0x8000000000 (1 << 39)
  ///
  /// Allows for launching activities (applications with the EMBEDDED flag) in
  /// a voice channel
  ///
  /// Channel types: V
  startEmbeddedActivities,
}

/// Extension to convert flags to values
extension PermissionExtension on Permission {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case Permission.createInstantInvite:
        return 1 << 0;
      case Permission.kickMembers:
        return 1 << 1;
      case Permission.banMembers:
        return 1 << 2;
      case Permission.administrator:
        return 1 << 3;
      case Permission.manageChannels:
        return 1 << 4;
      case Permission.manageGuild:
        return 1 << 5;
      case Permission.addReactions:
        return 1 << 6;
      case Permission.viewAuditLog:
        return 1 << 7;
      case Permission.prioritySpeaker:
        return 1 << 8;
      case Permission.stream:
        return 1 << 9;
      case Permission.viewChannel:
        return 1 << 10;
      case Permission.sendMessages:
        return 1 << 11;
      case Permission.sendTtsMessages:
        return 1 << 12;
      case Permission.manageMessages:
        return 1 << 13;
      case Permission.embedLinks:
        return 1 << 14;
      case Permission.attachFiles:
        return 1 << 15;
      case Permission.readMessageHistory:
        return 1 << 16;
      case Permission.mentionEveryone:
        return 1 << 17;
      case Permission.useExternalEmojis:
        return 1 << 18;
      case Permission.viewGuildInsights:
        return 1 << 19;
      case Permission.connect:
        return 1 << 20;
      case Permission.speak:
        return 1 << 21;
      case Permission.muteMembers:
        return 1 << 22;
      case Permission.deafenMembers:
        return 1 << 23;
      case Permission.moveMembers:
        return 1 << 24;
      case Permission.useVad:
        return 1 << 25;
      case Permission.changeNickname:
        return 1 << 26;
      case Permission.manageNicknames:
        return 1 << 27;
      case Permission.manageRoles:
        return 1 << 28;
      case Permission.manageWebhooks:
        return 1 << 29;
      case Permission.manageEmojisAndStickers:
        return 1 << 30;
      case Permission.useApplicationCommands:
        return 1 << 31;
      case Permission.requestToSpeak:
        return 1 << 32;
      case Permission.manageEvents:
        return 1 << 33;
      case Permission.manageThreads:
        return 1 << 34;
      case Permission.createPublicThreads:
        return 1 << 35;
      case Permission.createPrivateThreads:
        return 1 << 36;
      case Permission.useExternalStickers:
        return 1 << 37;
      case Permission.sendMessagesInThreads:
        return 1 << 38;
      case Permission.startEmbeddedActivities:
        return 1 << 39;
    }
  }
}
