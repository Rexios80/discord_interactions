// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'guild_scheduled_event_user.g.dart';

/// Guild Scheduled Event User structure
///
/// https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-user-object-guild-scheduled-event-user-structure
@JsonSerializable()
class GuildScheduledEventUser {
  /// the scheduled event id which the user subscribed to
  @JsonKey(name: 'guild_scheduled_event_id')
  final String guildScheduledEventId;

  /// user which subscribed to an event
  final User user;

  /// guild member data for this user for the guild which this event belongs
  /// to, if any
  final GuildMember? member;

  /// Constructor
  GuildScheduledEventUser({
    required this.guildScheduledEventId,
    required this.user,
    this.member,
  });

  /// From json
  factory GuildScheduledEventUser.fromJson(Map<String, dynamic> json) =>
      _$GuildScheduledEventUserFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildScheduledEventUserToJson(this);
}
