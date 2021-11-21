import 'package:json_annotation/json_annotation.dart';

/// Guild Nsfw levels
/// 
/// https://discord.com/developers/docs/resources/guild#guild-object-guild-nsfw-level
enum GuildNsfwLevel {
  /// default
  @JsonValue(0)
  defaultLevel,

  /// explicit
  @JsonValue(1)
  explicit,

  /// safe
  @JsonValue(2)
  safe,

  /// age restricted
  @JsonValue(3)
  ageRestricted,
}