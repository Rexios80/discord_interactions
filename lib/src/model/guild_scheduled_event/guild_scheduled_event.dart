// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'guild_scheduled_event.g.dart';

/// Guild Scheduled Event structure
///
/// See field requirements by entity type to understand the relationship
/// between [entityType] and the following fields: [channelId], [entityMetadata],
/// and [scheduledEndTime]
///
/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-structure
@JsonSerializable()
class GuildScheduledEvent {
  /// the id of the scheduled event
  final String? id;

  /// the guild id which the scheduled event belongs to
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the channel id in which the scheduled event will be hosted, or null if
  /// scheduled entity type is EXTERNAL
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// the id of the user that created the scheduled event
  ///
  /// creator_id will be null and creator will not be included for events
  /// created before October 25th, 2021, when the concept of creator_id was
  /// introduced and tracked.
  @JsonKey(name: 'creator_id')
  final String? creatorId;

  /// the name of the scheduled event (1-100 characters)
  final String? name;

  /// the description of the scheduled event (1-1000 characters)
  final String? description;

  /// the time the scheduled event will start
  @JsonKey(name: 'scheduled_start_time')
  final DateTime? scheduledStartTime;

  /// the time the scheduled event will end, required if entity_type is EXTERNAL
  @JsonKey(name: 'scheduled_end_time')
  final DateTime? scheduledEndTime;

  /// the privacy level of the scheduled event
  @JsonKey(name: 'privacy_level')
  final GuildScheduledEventPrivacyLevel? privacyLevel;

  /// the status of the scheduled event
  final GuildScheduledEventStatus? status;

  /// the type of the scheduled event
  @JsonKey(name: 'entity_type')
  final GuildScheduledEventEntityType? entityType;

  /// the id of an entity associated with a guild scheduled event
  @JsonKey(name: 'entity_id')
  final String? entityId;

  /// additional metadata for the guild scheduled event
  @JsonKey(name: 'entity_metadata')
  final GuildScheduledEventEntityMetadata? entityMetadata;

  /// the user that created the scheduled event
  final User? creator;

  /// the number of users subscribed to the scheduled event
  @JsonKey(name: 'user_count')
  final int? userCount;

  /// Constructor
  GuildScheduledEvent({
    this.id,
    this.guildId,
    this.channelId,
    this.creatorId,
    this.name,
    this.description,
    this.scheduledStartTime,
    this.scheduledEndTime,
    this.privacyLevel,
    this.status,
    this.entityType,
    this.entityId,
    this.entityMetadata,
    this.creator,
    this.userCount,
  });

  /// From json
  factory GuildScheduledEvent.fromJson(Map<String, dynamic> json) =>
      _$GuildScheduledEventFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildScheduledEventToJson(this);
}
