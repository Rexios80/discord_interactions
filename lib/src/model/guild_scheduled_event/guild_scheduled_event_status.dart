// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Guild Scheduled Event Status
///
/// Once status is set to COMPLETED or CANCELED, the status can no longer be updated
///
/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-status
enum GuildScheduledEventStatus {
  /// scheduled
  @JsonValue(1)
  scheduled,

  /// active
  @JsonValue(2)
  active,

  /// completed
  @JsonValue(3)
  completed,

  /// canceled
  @JsonValue(4)
  canceled,
}