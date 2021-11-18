import 'package:json_annotation/json_annotation.dart';

/// Message Activity types
enum MessageActivityType {
  /// join
  @JsonValue(1)
  join,

  /// spectate
  @JsonValue(2)
  spectate,

  /// listen
  @JsonValue(3)
  listen,

  /// join request
  @JsonValue(5)
  joinRequest,
}
