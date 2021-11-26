// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'invite.g.dart';

/// Invite structure
///
/// https://discord.com/developers/docs/resources/invite#invite-object-invite-structure
@JsonSerializable(includeIfNull: false)
class Invite {
  /// the invite code (unique ID)
  final String code;

  /// the guild this invite is for
  final Guild? guild;

  /// the channel this invite is for
  final Channel? channel;

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

  /// The rest of these fields are from the Invite Metadata structure
  ///
  /// https://discord.com/developers/docs/resources/invite#invite-metadata-object-invite-metadata-structure

  /// number of times this invite has been used
  final int? uses;

  /// max number of times this invite can be used
  @JsonKey(name: 'max_uses')
  final int? maxUses;

  /// duration (in seconds) after which the invite expires
  @JsonKey(name: 'max_age')
  final int? maxAge;

  /// whether this invite only grants temporary membership
  final bool? temporary;

  /// when this invite was created
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  /// Constructor
  Invite({
    required this.code,
    this.guild,
    this.channel,
    this.inviter,
    this.targetType,
    this.targetUser,
    this.targetApplication,
    this.approximatePresenceCount,
    this.approximateMemberCount,
    this.expiresAt,
    this.stageInstance,
    this.guildScheduledEvent,
    this.uses,
    this.maxUses,
    this.maxAge,
    this.temporary,
    this.createdAt,
  });

  /// From json
  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InviteToJson(this);
}
