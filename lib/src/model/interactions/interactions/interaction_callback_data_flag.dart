/// Interaction Callback Data Flags
/// 
/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-response-object-interaction-callback-data-flags
enum InteractionCallbackDataFlag {
  /// only the user receiving the message can see it
  ephemeral,
}

/// Extension to convert flags to values
extension InteractionCallbackDataFlagExtension on InteractionCallbackDataFlag {
  /// Byte values of the flags
  int get value {
    switch (this) {
      case InteractionCallbackDataFlag.ephemeral:
        return 1 << 6;
    }
  }
}
