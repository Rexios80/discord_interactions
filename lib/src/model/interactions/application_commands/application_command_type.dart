// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Application Command types
///
/// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-types
enum ApplicationCommandType {
  /// Slash commands; a text-based command that shows up when a user types /
  @JsonValue(1)
  chatInput,

  /// A UI-based command that shows up when you right click or tap on a user
  @JsonValue(2)
  user,

  /// A UI-based command that shows up when you right click or tap on a message
  @JsonValue(3)
  message,
}

/// Extension on [ApplicationCommandType]
extension ApplicationCommandTypeExtension on ApplicationCommandType {
  static const _enumMap = <ApplicationCommandType, int>{
    ApplicationCommandType.chatInput: 1,
    ApplicationCommandType.user: 2,
    ApplicationCommandType.message: 3,
  };

  /// Get the value of the enum
  int get value => _enumMap[this]!;

  /// Create a [ChannelType] from a value
  static ApplicationCommandType fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
