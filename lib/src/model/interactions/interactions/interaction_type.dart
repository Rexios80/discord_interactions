// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Interaction types
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-interaction-type
enum InteractionType {
  /// ping
  @JsonValue(1)
  ping,

  /// application command
  @JsonValue(2)
  applicationCommand,

  /// message component
  @JsonValue(3)
  messageComponent,

  /// application command autocomplete
  @JsonValue(4)
  applicationCommandAutocomplete,
}
