import 'package:json_annotation/json_annotation.dart';

/// Premium types denote the level of premium a user has
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
