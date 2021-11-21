// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Mfa levels
///
/// https://discord.com/developers/docs/resources/guild#guild-object-mfa-level
enum MfaLevel {
  /// guild has no MFA/2FA requirement for moderation actions
  @JsonValue(0)
  none,

  /// guild has a 2FA requirement for moderation actions
  @JsonValue(1)
  elevated,
}
