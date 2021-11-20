// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Component types
///
/// https://discord.com/developers/docs/interactions/message-components#component-object-component-types
enum ComponentType {
  /// A container for other components
  @JsonValue(1)
  actionRow,

  /// A button object
  @JsonValue(2)
  button,

  /// A select menu for picking from choices
  @JsonValue(3)
  selectMenu,
}
