import 'package:discord_interactions/src/model/teams/team.dart';
import 'package:discord_interactions/src/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

/// Application structure
@JsonSerializable()
class Application {
  /// the id of the app
  final String id;

  /// the name of the app
  final String name;

  /// the icon hash of the app
  final String? icon;

  /// the description of the app
  final String description;

  /// an array of rpc origin urls, if rpc is enabled
  @JsonKey(name: 'rpc_origins')
  final List<String>? rpcOrigins;

  /// when false only app owner can join the app's bot to guilds
  @JsonKey(name: 'bot_public')
  final bool botPublic;

  /// when true the app's bot will only join upon completion of the full oauth2
  /// code grant flow
  @JsonKey(name: 'bot_require_code_grant')
  final bool botRequireCodeGrant;

  /// the url of the app's terms of service
  @JsonKey(name: 'terms_of_service_url')
  final String? termsOfServiceUrl;

  /// the url of the app's privacy policy
  @JsonKey(name: 'privacy_policy_url')
  final String? privacyPolicyUrl;

  /// partial user object containing info on the owner of the application
  final User? owner;

  /// if this application is a game sold on Discord, this field will be the
  /// summary field for the store page of its primary sku
  final String summary;

  /// the hex encoded key for verification in interactions and the GameSDK's
  /// GetTicket
  @JsonKey(name: 'verify_key')
  final String verifyKey;

  /// if the application belongs to a team, this will be a list of the members
  /// of that team
  final Team? team;

  /// if this application is a game sold on Discord, this field will be the
  /// guild to which it has been linked
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// if this application is a game sold on Discord, this field will be the id
  /// of the "Game SKU" that is created, if exists
  @JsonKey(name: 'primary_sku_id')
  final String? primarySkuId;

  /// if this application is a game sold on Discord, this field will be the URL
  /// slug that links to the store page
  final String? slug;

  /// the application's default rich presence invite cover image hash
  @JsonKey(name: 'cover_image')
  final String? coverImage;

  /// the application's public flags
  /// TODO: Make this a list of ApplicationFlag
  final int? flags;

  /// Constructor
  Application({
    required this.id,
    required this.name,
    this.icon,
    required this.description,
    this.rpcOrigins,
    required this.botPublic,
    required this.botRequireCodeGrant,
    this.termsOfServiceUrl,
    this.privacyPolicyUrl,
    this.owner,
    required this.summary,
    required this.verifyKey,
    this.team,
    this.guildId,
    this.primarySkuId,
    this.slug,
    this.coverImage,
    this.flags,
  });

  /// From json
  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
