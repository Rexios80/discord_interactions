// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Integration Expire behaviors
///
/// https://discord.com/developers/docs/resources/guild#integration-object-integration-expire-behaviors
enum IntegrationExpireBehavior {
  /// remove role
  @JsonValue(0)
  removeRole,

  /// kick
  @JsonValue(1)
  kick,
}
