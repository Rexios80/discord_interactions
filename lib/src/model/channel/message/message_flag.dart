/// Message flags
///
/// https://discord.com/developers/docs/resources/channel#message-object-message-flags
enum MessageFlag {
  /// this message has been published to subscribed channels (via Channel Following)
  crossposted,

  /// this message originated from a message in another channel (via Channel Following)
  isCrosspost,

  /// do not include any embeds when serializing this message
  suppressEmbeds,

  /// the source message for this crosspost has been deleted (via Channel Following)
  sourceMessageDeleted,

  /// this message came from the urgent message system
  urgent,

  /// this message has an associated thread, with the same id as the message
  hasThread,

  /// this message is only visible to the user who invoked the Interaction
  ephemeral,

  /// this message is an Interaction Response and the bot is "thinking"
  loading,
}

/// Extension to convert flags to values
extension MessageFlagExtension on MessageFlag {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case MessageFlag.crossposted:
        return 1 << 0;
      case MessageFlag.isCrosspost:
        return 1 << 1;
      case MessageFlag.suppressEmbeds:
        return 1 << 2;
      case MessageFlag.sourceMessageDeleted:
        return 1 << 3;
      case MessageFlag.urgent:
        return 1 << 4;
      case MessageFlag.hasThread:
        return 1 << 5;
      case MessageFlag.ephemeral:
        return 1 << 6;
      case MessageFlag.loading:
        return 1 << 7;
    }
  }
}
