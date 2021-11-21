// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Guild Scheduled Event Entity types
///
/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-entity-types
enum GuildScheduledEventEntityType {
  /// stage instance
  @JsonValue(1)
  stageInstance,

  /// voice
  @JsonValue(2)
  voice,

  /// external
  @JsonValue(3)
  external,
}
