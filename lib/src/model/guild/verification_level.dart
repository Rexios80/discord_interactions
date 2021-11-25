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
  static const _enumMap = <VerificationLevel, int>{
    VerificationLevel.none: 0,
    VerificationLevel.low: 1,
    VerificationLevel.medium: 2,
    VerificationLevel.high: 3,
    VerificationLevel.veryHigh: 4,
  };

  /// Get the int value
  int get value => _enumMap[this]!;

  /// Create a [VerificationLevel] from an [int]
  static VerificationLevel fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
