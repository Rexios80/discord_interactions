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
