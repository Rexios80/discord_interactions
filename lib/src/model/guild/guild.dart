// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/permission_converter.dart';
import 'package:discord_interactions/src/converter/flag/system_channel_flag_converter.dart';

part 'guild.g.dart';

/// Guild structure
///
/// * These fields are only sent within the GUILD_CREATE event
///
/// ** These fields are only sent when using the GET Current User Guilds endpoint and are relative to the requested user
///
/// https://discord.com/developers/docs/resources/guild#guild-object-guild-structure
@JsonSerializable(includeIfNull: false)
class Guild {
  /// guild id
  final String? id;

  /// guild name (2-100 characters, excluding trailing and leading whitespace)
  final String? name;

  /// icon hash
  final String? icon;

  /// icon hash, returned when in the template object
  @JsonKey(name: 'icon_hash')
  final String? iconHash;

  /// splash hash
  final String? splash;

  /// discovery splash hash; only present for guilds with the "DISCOVERABLE"
  /// feature
  @JsonKey(name: 'discovery_splash')
  final String? discoverySplash;

  /// true if the user is the owner of the guild
  ///
  /// **
  final bool? owner;

  /// id of the owner
  final String? ownerId;

  /// total permissions for the user in the guild (excludes overwrites)
  ///
  /// **
  @PermissionConverterNullable()
  final List<Permission>? permissions;

  /// id of afk channel
  @JsonKey(name: 'afk_channel_id')
  final String? afkChannelId;

  /// afk timeout in seconds
  @JsonKey(name: 'afk_timeout')
  final int? afkTimeout;

  /// true if the server widget is enabled
  @JsonKey(name: 'widget_enabled')
  final bool? widgetEnabled;

  /// the channel id that the widget will generate an invite to, or null if set
  /// to no invite
  @JsonKey(name: 'widget_channel_id')
  final String? widgetChannelId;

  /// verification level required for the guild
  @JsonKey(name: 'verification_level')
  final VerificationLevel? verificationLevel;

  /// default message notifications level
  @JsonKey(name: 'default_message_notifications')
  final DefaultMessageNotificationLevel? defaultMessageNotifications;

  /// explicit content filter level
  @JsonKey(name: 'explicit_content_filter')
  final ExplicitContentFilterLevel? explicitContentFilter;

  /// roles in the guild
  final List<Role>? roles;

  /// custom guild emojis
  final List<Emoji>? emojis;

  /// enabled guild features
  final List<GuildFeature>? features;

  /// required MFA level for the guild
  @JsonKey(name: 'mfa_level')
  final MfaLevel? mfaLevel;

  /// application id of the guild creator if it is bot-created
  @JsonKey(name: 'application_id')
  final String? applicationId;

  /// the id of the channel where guild notices such as welcome messages and
  /// boost events are posted
  @JsonKey(name: 'system_channel_id')
  final String? systemChannelId;

  /// system channel flags
  @JsonKey(name: 'system_channel_flags')
  @SystemChannelFlagConverter()
  final List<SystemChannelFlag>? systemChannelFlags;

  /// the id of the channel where Community guilds can display rules and/or
  /// guidelines
  @JsonKey(name: 'rules_channel_id')
  final String? rulesChannelId;

  /// when this guild was joined at
  ///
  /// *
  @JsonKey(name: 'joined_at')
  final DateTime? joinedAt;

  /// true if this is considered a large guild
  ///
  /// *
  final bool? large;

  /// true if this guild is unavailable due to an outage
  ///
  /// *
  final bool? unavailable;

  /// total number of members in this guild
  ///
  /// *
  @JsonKey(name: 'member_count')
  final int? memberCount;

  /// states of members currently in voice channels; lacks the guild_id key
  ///
  /// *
  @JsonKey(name: 'voice_states')
  final List<VoiceState>? voiceStates;

  /// users in the guild
  ///
  /// *
  final List<GuildMember>? members;

  /// channels in the guild
  ///
  /// *
  final List<Channel>? channels;

  /// all active threads in the guild that current user has permission to view
  ///
  /// *
  final List<Channel>? threads;

  /// presences of the members in the guild, will only include non-offline
  /// members if the size is greater than large threshold
  ///
  /// *
  final List<PresenceUpdateEvent>? presences;

  /// the maximum number of presences for the guild (null is always returned,
  /// apart from the largest of guilds)
  @JsonKey(name: 'max_presences')
  final int? maxPresences;

  /// the maximum number of members for the guild
  @JsonKey(name: 'max_members')
  final int? maxMembers;

  /// the vanity url code for the guild
  @JsonKey(name: 'vanity_url_code')
  final String? vanityUrlCode;

  /// the description of a Community guild
  final String? description;

  /// banner hash
  final String? banner;

  /// premium tier (Server Boost level)
  @JsonKey(name: 'premium_tier')
  final PremiumTier? premiumTier;

  /// the number of boosts this guild currently has
  @JsonKey(name: 'premium_subscription_count')
  final int? premiumSubscriptionCount;

  /// the preferred locale of a Community guild; used in server discovery and
  /// notices from Discord; defaults to "en-US"
  @JsonKey(name: 'preferred_locale')
  final String? preferredLocale;

  /// the id of the channel where admins and moderators of Community guilds
  /// receive notices from Discord
  @JsonKey(name: 'public_updates_channel_id')
  final String? publicUpdatesChannelId;

  /// the maximum amount of users in a video channel
  @JsonKey(name: 'max_video_channel_users')
  final int? maxVideoChannelUsers;

  /// approximate number of members in this guild, returned from the GET
  /// /guilds/<id> endpoint when with_counts is true
  @JsonKey(name: 'approximate_member_count')
  final int? approximateMemberCount;

  /// approximate number of non-offline members in this guild, returned from the
  /// GET /guilds/<id> endpoint when with_counts is true
  @JsonKey(name: 'approximate_presence_count')
  final int? approximatePresenceCount;

  /// the welcome screen of a Community guild, shown to new members, returned in
  /// an Invite's guild object
  @JsonKey(name: 'welcome_screen')
  final WelcomeScreen? welcomeScreen;

  /// guild NSFW level
  @JsonKey(name: 'nsfw_level')
  final GuildNsfwLevel? nsfwLevel;

  /// Stage instances in the guild
  ///
  /// *
  @JsonKey(name: 'stage_instances')
  final List<StageInstance>? stageInstances;

  /// custom guild stickers
  final List<Sticker>? stickers;

  /// Constructor
  Guild({
    this.id,
    this.name,
    this.icon,
    this.iconHash,
    this.splash,
    this.discoverySplash,
    this.owner,
    this.ownerId,
    this.permissions,
    this.afkChannelId,
    this.afkTimeout,
    this.widgetEnabled,
    this.widgetChannelId,
    this.verificationLevel,
    this.defaultMessageNotifications,
    this.explicitContentFilter,
    this.roles,
    this.emojis,
    this.features,
    this.mfaLevel,
    this.applicationId,
    this.systemChannelId,
    this.systemChannelFlags,
    this.rulesChannelId,
    this.joinedAt,
    this.large,
    this.unavailable,
    this.memberCount,
    this.voiceStates,
    this.members,
    this.channels,
    this.threads,
    this.presences,
    this.maxPresences,
    this.maxMembers,
    this.vanityUrlCode,
    this.description,
    this.banner,
    this.premiumTier,
    this.premiumSubscriptionCount,
    this.preferredLocale,
    this.publicUpdatesChannelId,
    this.maxVideoChannelUsers,
    this.approximateMemberCount,
    this.approximatePresenceCount,
    this.welcomeScreen,
    this.nsfwLevel,
    this.stageInstances,
    this.stickers,
  });

  /// From json
  factory Guild.fromJson(Map<String, dynamic> json) => _$GuildFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildToJson(this);
}
