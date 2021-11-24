// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Verification levels
///
/// https://discord.com/developers/docs/resources/guild#guild-object-verification-level
enum VerificationLevel {
  /// unrestricted
  @JsonValue(0)
  none,

  /// must have verified email on account
  @JsonValue(1)
  low,

  /// must be registered on Discord for longer than 5 minutes
  @JsonValue(2)
  medium,

  /// must be a member of the server for longer than 10 minutes
  @JsonValue(3)
  high,

  /// must have a verified phone number
  @JsonValue(4)
  veryHigh,
}

/// Extension on [VerificationLevel]
extension VerificationLevelExtension on VerificationLevel {
  /// Create a [VerificationLevel] from an [int]
  static VerificationLevel fromValue(int value) {
    switch (value) {
      case 0:
        return VerificationLevel.none;
      case 1:
        return VerificationLevel.low;
      case 2:
        return VerificationLevel.medium;
      case 3:
        return VerificationLevel.high;
      case 4:
        return VerificationLevel.veryHigh;
      default:
        throw ArgumentError('Unknown verification level: $value');
    }
  }
}
