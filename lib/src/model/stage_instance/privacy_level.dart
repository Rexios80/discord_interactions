// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Stage Instance Privacy levels
///
/// https://discord.com/developers/docs/resources/stage-instance#stage-instance-object-privacy-level
enum PrivacyLevel {
  /// The Stage instance is visible publicly, such as on Stage Discovery.
  @JsonValue(1)
  public,

  /// The Stage instance is visible to only guild members.
  @JsonValue(2)
  guildOnly,
}
