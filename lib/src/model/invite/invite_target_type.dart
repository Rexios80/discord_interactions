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

/// Extension on [InviteTargetType]
extension InviteTargetTypeExtension on InviteTargetType {
  /// Get the int value of the enum
  int get value {
    switch (this) {
      case InviteTargetType.stream:
        return 1;
      case InviteTargetType.embeddedApplication:
        return 2;
    }
  }
}
