// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Guild Scheduled Event Privacy levels
///
/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-privacy-level
enum GuildScheduledEventPrivacyLevel {
  /// the scheduled event is only accessible to guild members
  @JsonValue(2)
  guildOnly,
}
