// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'guild_preview.g.dart';

/// Guild Preview structure
///
/// https://discord.com/developers/docs/resources/guild#guild-preview-object-guild-preview-structure
@JsonSerializable(includeIfNull: false)
class GuildPreview {
  /// guild id
  final String id;

  /// guild name (2-100 characters)
  final String name;

  /// icon hash
  final String? icon;

  /// splash hash
  final String? splash;

  /// discovery splash hash
  @JsonKey(name: 'discovery_splash')
  final String? discoverySplash;

  /// custom guild emojis
  final List<Emoji>? emojis;

  /// enabled guild features
  final List<GuildFeature> features;

  /// approximate number of members in this guild
  @JsonKey(name: 'approximate_member_count')
  final int approximateMemberCount;

  /// approximate number of online members in this guild
  @JsonKey(name: 'approximate_presence_count')
  final int approximatePresenceCount;

  /// the description for the guild, if the guild is discoverable
  final String? description;

  /// Constructor
  GuildPreview({
    required this.id,
    required this.name,
    this.icon,
    this.splash,
    this.discoverySplash,
    this.emojis,
    required this.features,
    required this.approximateMemberCount,
    required this.approximatePresenceCount,
    this.description,
  });

  /// From json
  static GuildPreview fromJson(Map<String, dynamic> json) =>
      _$GuildPreviewFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildPreviewToJson(this);
}
