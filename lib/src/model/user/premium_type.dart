// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Premium types
///
/// Premium types denote the level of premium a user has
///
/// https://discord.com/developers/docs/resources/user#user-object-premium-types
enum PremiumType {
  /// none
  @JsonValue(0)
  none,

  /// Nitro Classic
  @JsonValue(1)
  nitroClassic,

  /// Nitro
  @JsonValue(2)
  nitro,
}
