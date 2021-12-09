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

/// Extension on [GuildScheduledEventEntityType]
extension GuildScheduledEventEntityTypeExtension
    on GuildScheduledEventEntityType {
  static const _enumMap = <GuildScheduledEventEntityType, int>{
    GuildScheduledEventEntityType.stageInstance: 1,
    GuildScheduledEventEntityType.voice: 2,
    GuildScheduledEventEntityType.external: 3,
  };

  /// Get the enum value
  int get value => _enumMap[this]!;

  /// Create a [PrivacyLevel] from an [int]
  static GuildScheduledEventEntityType fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
