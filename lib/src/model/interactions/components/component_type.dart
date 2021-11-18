import 'package:json_annotation/json_annotation.dart';

/// They type of component
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
