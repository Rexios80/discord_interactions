// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Application Command Option types
///
/// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-option-type
enum ApplicationCommandOptionType {
  /// sub command
  @JsonValue(1)
  subCommand,

  /// sub command group
  @JsonValue(2)
  subCommandGroup,

  /// string
  @JsonValue(3)
  string,

  /// Any integer between -2^53 and 2^53
  @JsonValue(4)
  integer,

  /// boolean
  @JsonValue(5)
  boolean,

  /// user
  ///
  /// User ID
  @JsonValue(6)
  user,

  /// Includes all channel types + categories
  ///
  /// Channel ID
  @JsonValue(7)
  channel,

  /// role
  ///
  /// Role ID
  @JsonValue(8)
  role,

  /// Includes users and roles
  @JsonValue(9)
  mentionable,

  /// Any double between -2^53 and 2^53
  @JsonValue(10)
  number,
}
