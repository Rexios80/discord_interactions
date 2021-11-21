// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Invite Target types
///
/// https://discord.com/developers/docs/resources/invite#invite-object-invite-target-types
enum InviteTargetType {
  /// stream
  @JsonValue(1)
  stream,

  /// embedded application
  @JsonValue(2)
  embeddedApplication,
}
