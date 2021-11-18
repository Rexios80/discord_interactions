// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// the type of interaction
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
