// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'interaction.g.dart';

@JsonSerializable(includeIfNull: false)

/// Inteaction structure
///
/// An [Interaction] is the message that your application receives when a user
/// uses an application command or a message component.
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-object-interaction-structure
class Interaction {
  /// id of the interaction
  final String id;

  /// id of the application this interaction is for
  /// 
  /// This is equivalent to the bot's user id
  @JsonKey(name: 'application_id')
  final String applicationId;

  /// the type of interaction
  final InteractionType type;

  /// the command data payload
  ///
  /// This is always present on application command and message component interaction types.
  /// It is optional for future-proofing against new interaction types
  final InteractionData? data;

  /// the guild it was sent from
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the channel it was sent from
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// guild member data for the invoking user, including permissions
  ///
  /// [member] is sent when the interaction is invoked in a guild, and [user] is sent when invoked in a DM
  final GuildMember? member;

  /// user object for the invoking user, if invoked in a DM
  ///
  /// [member] is sent when the interaction is invoked in a guild, and [user] is sent when invoked in a DM
  final User? user;

  /// a continuation token for responding to the interaction
  final String token;

  /// read-only property, always 1
  final int version;

  /// for components, the message they were attached to
  final Message? message;

  /// Convenience method to get the id of the invoking user
  String get invokerId => member?.user?.id ?? user!.id;

  /// Constructor
  Interaction({
    required this.id,
    required this.applicationId,
    required this.type,
    this.data,
    this.guildId,
    this.channelId,
    this.member,
    this.user,
    required this.token,
    required this.version,
    this.message,
  });

  /// From json
  factory Interaction.fromJson(Map<String, dynamic> json) =>
      _$InteractionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InteractionToJson(this);
}
