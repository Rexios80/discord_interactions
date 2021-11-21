// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'presence_update_event.g.dart';

/// Presence Update Event fields
///
/// If you are using Gateway Intents, you must specify the GUILD_PRESENCES
/// intent in order to receive Presence Update events
///
/// The user object within this event can be partial, the only field which must
/// be sent is the id field, everything else is optional. Along with this
/// limitation, no fields are required, and the types of the fields are not
/// validated. Your client should expect any combination of fields and types
/// within this event.
///
/// https://discord.com/developers/docs/topics/gateway#presence-update-presence-update-event-fields
@JsonSerializable()
class PresenceUpdateEvent {
  /// the user presence is being updated for
  final User? user;

  /// id of the guild
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// either "idle", "dnd", "online", or "offline"
  final PresenceStatus? status;

  /// user's current activities
  final List<Activity>? activities;

  /// user's platform-dependent status
  @JsonKey(name: 'client_status')
  final ClientStatus? clientStatus;

  /// Constructor
  PresenceUpdateEvent({
    this.user,
    this.guildId,
    this.status,
    this.activities,
    this.clientStatus,
  });

  /// From json
  factory PresenceUpdateEvent.fromJson(Map<String, dynamic> json) =>
      _$PresenceUpdateEventFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$PresenceUpdateEventToJson(this);
}
