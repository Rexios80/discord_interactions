// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'guild_scheduled_event_entity_metadata.g.dart';

/// Guild Scheduled Event Entity Metadata structure
///
/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-entity-metadata
@JsonSerializable(includeIfNull: false)
class GuildScheduledEventEntityMetadata {
  /// location of the event (1-100 characters)
  ///
  /// required for events with 'entity_type': EXTERNAL
  final String? location;

  /// Constructor
  GuildScheduledEventEntityMetadata({this.location});

  /// From json
  factory GuildScheduledEventEntityMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GuildScheduledEventEntityMetadataFromJson(json);

  /// To json
  Map<String, dynamic> toJson() =>
      _$GuildScheduledEventEntityMetadataToJson(this);
}
