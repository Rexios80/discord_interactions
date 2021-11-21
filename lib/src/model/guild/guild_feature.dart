// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Guild features
///
/// https://discord.com/developers/docs/resources/guild#guild-object-guild-features
enum GuildFeature {
  /// guild has access to set an animated guild icon
  @JsonValue('ANIMATED_ICON')
  animatedIcon,

  /// guild has access to set a guild banner image
  @JsonValue('BANNER')
  banner,

  /// guild has access to use commerce features (i.e. create store channels)
  @JsonValue('COMMERCE')
  commerce,

  /// guild can enable welcome screen, Membership Screening, stage channels and
  /// discovery, and receives community updates
  @JsonValue('COMMUNITY')
  community,

  /// guild is able to be discovered in the directory
  @JsonValue('DISCOVERABLE')
  discoverable,

  /// guild is able to be featured in the directory
  @JsonValue('FEATURABLE')
  featurable,

  /// guild has access to set an invite splash background
  @JsonValue('INVITE_SPLASH')
  inviteSplash,

  /// guild has enabled Membership Screening
  @JsonValue('MEMBER_VERIFICATION_GATE_ENABLED')
  memberVerificationGateEnabled,

  /// guild has enabled monetization
  @JsonValue('MONETIZATION_ENABLED')
  monetizationEnabled,

  /// guild has increased custom sticker slots
  @JsonValue('MORE_STICKERS')
  moreStickers,

  /// guild has access to create news channels
  @JsonValue('NEWS')
  news,

  /// guild is partnered
  @JsonValue('PARTNERED')
  partnered,

  /// guild can be previewed before joining via Membership Screening or the
  /// directory
  @JsonValue('PREVIEW_ENABLED')
  previewEnabled,

  /// guild has access to create private threads
  @JsonValue('PRIVATE_THREADS')
  privateThreads,

  /// guild is able to set role icons
  @JsonValue('ROLE_ICONS')
  roleIcons,

  /// guild has access to the seven day archive time for threads
  @JsonValue('SEVEN_DAY_THREAD_ARCHIVE')
  sevenDayThreadArchive,

  /// guild has access to the three day archive time for threads
  @JsonValue('THREE_DAY_THREAD_ARCHIVE')
  threeDayThreadArchive,

  /// guild has enabled ticketed events
  @JsonValue('TICKETED_EVENTS_ENABLED')
  ticketedEventsEnabled,

  /// guild has access to set a vanity URL
  @JsonValue('VANITY_URL')
  vanityUrl,

  /// guild is verified
  @JsonValue('VERIFIED')
  verified,

  /// guild has access to set 384kbps bitrate in voice (previously VIP voice
  /// servers)
  @JsonValue('VIP_REGIONS')
  vipRegions,

  /// guild has enabled the welcome screen
  @JsonValue('WELCOME_SCREEN_ENABLED')
  welcomeScreenEnabled,
}
