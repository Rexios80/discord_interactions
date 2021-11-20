// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/guild/guild_member.dart';
import 'package:discord_interactions/src/model/user/premium_type.dart';

part 'user.g.dart';

/// User structure
/// 
/// https://discord.com/developers/docs/resources/user#user-object-user-structure
@JsonSerializable()
class User {
  /// the user's id
  ///
  /// Required OAuth2 scope: identify
  final String id;

  /// the user's username, not unique across the platform
  ///
  /// Required OAuth2 scope: identify
  final String username;

  /// the user's 4-digit discord-tag
  ///
  /// Required OAuth2 scope: identify
  final String discriminator;

  /// the user's avatar hash
  ///
  /// Required OAuth2 scope: identify
  final String? avatar;

  /// whether the user belongs to an OAuth2 application
  ///
  /// Required OAuth2 scope: identify
  final bool? bot;

  /// whether the user is an Official Discord System user (part of the urgent message system)
  ///
  /// Required OAuth2 scope: identify
  final bool? system;

  /// whether the user has two factor enabled on their account
  ///
  /// Required OAuth2 scope: identify
  @JsonKey(name: 'mfa_enabled')
  final bool? mfaEnabled;

  /// the user's banner hash
  ///
  /// Required OAuth2 scope: identify
  final String? banner;

  /// the user's banner color encoded as an integer representation of hexadecimal color code
  ///
  /// Required OAuth2 scope: identify
  @JsonKey(name: 'accent_color')
  final int? accentColor;

  /// the user's chosen language option
  ///
  /// Required OAuth2 scope: identify
  final String? locale;

  /// whether the email on record for this user has been verified
  ///
  /// Required OAuth2 scope: email
  final bool? verified;

  /// the user's email
  ///
  /// Required OAuth2 scope: email
  final String? email;

  /// the flags on a user's account
  ///
  /// Required OAuth2 scope: identify
  /// TODO: Make this a list of UserFlag
  final int? flags;

  /// the type of Nitro subscription on a user's account
  ///
  /// Required OAuth2 scope: identify
  @JsonKey(name: 'premium_type')
  final PremiumType? premiumType;

  /// the public flags on a user's account
  ///
  /// Required OAuth2 scope: identify
  /// TODO: Make this a list of UserFlag
  @JsonKey(name: 'public_flags')
  final int? publicFlags;

  /// partial [GuildMember] object
  final GuildMember? member;

  /// Constructor
  User({
    required this.id,
    required this.username,
    required this.discriminator,
    this.avatar,
    this.bot,
    this.system,
    this.mfaEnabled,
    this.banner,
    this.accentColor,
    this.locale,
    this.verified,
    this.email,
    this.flags,
    this.premiumType,
    this.publicFlags,
    this.member,
  });

  /// From json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
