// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Message Activity types
///
/// https://discord.com/developers/docs/resources/channel#message-object-message-activity-types
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
