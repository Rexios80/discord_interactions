// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/iso8601_converter.dart';

part 'invite.g.dart';

/// Invite structure
///
/// https://discord.com/developers/docs/resources/invite#invite-object-invite-structure
@JsonSerializable()
class Invite {
  /// the invite code (unique ID)
  final String code;

  /// the guild this invite is for
  final Guild? guild;

  /// the channel this invite is for
  final Channel channel;

  /// the user who created the invite
  final User? inviter;

  /// the type of target for this voice channel invite
  @JsonKey(name: 'target_type')
  final InviteTargetType? targetType;

  /// the user whose stream to display for this voice channel stream invite
  @JsonKey(name: 'target_user')
  final User? targetUser;

  /// the embedded application to open for this voice channel embedded
  /// application invite
  @JsonKey(name: 'target_application')
  final Application? targetApplication;

  /// approximate count of online members, returned from the GET /invites/<code>
  /// endpoint when with_counts is true
  @JsonKey(name: 'approximate_presence_count')
  final int? approximatePresenceCount;

  /// approximate count of total members, returned from the GET /invites/<code>
  /// endpoint when with_counts is true
  @JsonKey(name: 'approximate_member_count')
  final int? approximateMemberCount;

  /// the expiration date of this invite, returned from the GET /invites/<code>
  /// endpoint when with_expiration is true
  @ISO8601ConverterNullable()
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;

  /// stage instance data if there is a public Stage instance in the Stage
  /// channel this invite is for
  @JsonKey(name: 'stage_instance')
  final InviteStageInstance? stageInstance;

  /// guild scheduled event data, only included if guild_scheduled_event_id
  /// contains a valid guild scheduled event id
  @JsonKey(name: 'guild_scheduled_event')
  final GuildScheduledEvent? guildScheduledEvent;

  /// Constructor
  Invite({
    required this.code,
    this.guild,
    required this.channel,
    this.inviter,
    this.targetType,
    this.targetUser,
    this.targetApplication,
    this.approximatePresenceCount,
    this.approximateMemberCount,
    this.expiresAt,
    this.stageInstance,
    this.guildScheduledEvent,
  });

  /// From json
  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InviteToJson(this);
}
