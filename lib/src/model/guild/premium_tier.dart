// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Premium tiers
///
/// https://discord.com/developers/docs/resources/guild#guild-object-premium-tier
enum PremiumTier {
  /// guild has not unlocked any Server Boost perks
  @JsonValue(0)
  none,

  /// guild has unlocked Server Boost level 1 perks
  @JsonValue(1)
  tier1,

  /// guild has unlocked Server Boost level 2 perks
  @JsonValue(2)
  tier2,

  /// guild has unlocked Server Boost level 3 perks
  @JsonValue(3)
  tier3,
}
