// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/date/unix_time_converter.dart';

part 'activity.g.dart';

/// Activity structure
///
/// Bots are only able to send name, type, and optionally url.
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-structure
@JsonSerializable()
class Activity {
  /// the activity's name
  final String name;

  /// activity type
  final ActivityType type;

  /// stream url, is validated when type is 1
  final String? url;

  /// unix timestamp (in milliseconds) of when the activity was added to the
  /// user's session
  @JsonKey(name: 'created_at')
  @UnixTimeConverter()
  final DateTime createdAt;

  /// unix timestamps for start and/or end of the game
  final ActivityTimestamps? timestamps;

  /// application id for the game
  @JsonKey(name: 'application_id')
  final String? applicationId;

  /// what the player is currently doing
  final String? details;

  /// the user's current party status
  final String? state;

  /// the emoji used for a custom status
  final Emoji? emoji;

  /// information for the current party of the player
  final Party? party;

  /// images for the presence and their hover texts
  final Assets? assets;

  /// secrets for Rich Presence joining and spectating
  final Secrets? secrets;

  /// whether or not the activity is an instanced game session
  final bool? instance;

  /// activity flags ORd together, describes what the payload includes
  final List<ActivityFlag>? flags;

  /// the custom buttons shown in the Rich Presence (max 2)
  final List<Button>? buttons;

  /// Constructor
  Activity({
    required this.name,
    this.type,
    this.url,
    required this.createdAt,
    this.timestamps,
    this.applicationId,
    this.details,
    this.state,
    this.emoji,
    this.party,
    this.assets,
    this.secrets,
    this.instance,
    this.flags,
    this.buttons,
  });

  /// From json
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
