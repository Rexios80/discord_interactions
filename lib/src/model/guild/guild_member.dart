// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/converter/flag/permission_converter.dart';
import 'package:discord_interactions/src/converter/iso8601_converter.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

part 'guild_member.g.dart';

/// Guild Member structure
///
/// https://discord.com/developers/docs/resources/guild#guild-member-object-guild-member-structure
@JsonSerializable()
class GuildMember {
  /// the user this guild member represents
  ///
  /// The field user won't be included in the member object attached to
  /// MESSAGE_CREATE and MESSAGE_UPDATE gateway events.
  final User? user;

  /// this users guild nickname
  final String? nick;

  /// the member's guild avatar hash
  final String? avatar;

  /// array of role object ids
  final List<String> roles;

  /// when the user joined the guild
  @ISO8601Converter()
  @JsonKey(name: 'joined_at')
  final DateTime joinedAt;

  /// when the user started boosting the guild
  @ISO8601ConverterNullable()
  @JsonKey(name: 'premium_since')
  final DateTime? premiumSince;

  /// whether the user is deafened in voice channels
  final bool? deaf;

  /// whether the user is muted in voice channels
  final bool? mute;

  /// whether the user has not yet passed the guild's Membership Screening requirements
  ///
  /// In GUILD_ events, pending will always be included as true or false.
  /// In non GUILD_ events which can only be triggered by non-pending users,
  /// pending will not be included.
  final bool? pending;

  /// total permissions of the member in the channel, including overwrites,
  /// returned when in the interaction object
  @PermissionConverterNullable()
  final List<Permission>? permissions;

  /// Constructor
  GuildMember({
    this.user,
    this.nick,
    this.avatar,
    required this.roles,
    required this.joinedAt,
    this.premiumSince,
    required this.deaf,
    required this.mute,
    this.pending,
    this.permissions,
  });

  /// From json
  factory GuildMember.fromJson(Map<String, dynamic> json) =>
      _$GuildMemberFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildMemberToJson(this);
}
