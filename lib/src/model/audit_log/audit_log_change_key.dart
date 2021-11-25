// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Audit Log Change keys
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-change-object-audit-log-change-key
enum AuditLogChangeKey {
  /// afk channel changed
  ///
  /// Object changed: guild
  ///
  /// Type: snowflake
  @JsonValue('afk_channel_id')
  afkChannelId,

  /// afk timeout duration changed
  ///
  /// Object changed: guild
  ///
  /// Type: integer
  @JsonValue('afk_timeout')
  afkTimeout,

  /// a permission on a text or voice channel was allowed for a role
  ///
  /// Object changed: role
  ///
  /// Type: string
  allow,

  /// application id of the added or removed webhook or bot
  ///
  /// Object changed: channel
  ///
  /// Type: snowflake
  @JsonValue('application_id')
  applicationId,

  /// thread is now archived/unarchived
  ///
  /// Object changed: thread
  ///
  /// Type: bool
  archived,

  /// empty string
  ///
  /// Object changed: sticker
  ///
  /// Type: string
  asset,

  /// auto archive duration changed
  ///
  /// Object changed: thread
  ///
  /// Type: [ThreadAutoArchiveDuration]
  @JsonValue('auto_archive_duration')
  autoArchiveDuration,

  /// availability of sticker changed
  ///
  /// Object changed: sticker
  ///
  /// Type: boolean
  available,

  /// user avatar changed
  ///
  /// Object changed: user
  ///
  /// Type: string
  @JsonValue('avatar_hash')
  avatarHash,

  /// guild banner changed
  ///
  /// Object changed: guild
  ///
  /// Type: string
  @JsonValue('banner_hash')
  bannerHash,

  /// voice channel bitrate changed
  ///
  /// Object changed: channel
  ///
  /// Type: integer
  bitrate,

  /// channel for invite code or guild scheduled event changed
  ///
  /// Object changed: invite or guild scheduled event
  ///
  /// Type: snowflake
  @JsonValue('channel_id')
  channelId,

  /// invite code changed
  ///
  /// Object changed: invite
  ///
  /// Type: string
  code,

  /// role color changed
  ///
  /// Object changed: role
  ///
  /// Type: integer
  color,

  /// user server deafened/undeafened
  ///
  /// Object changed: user
  ///
  /// Type: boolean
  deaf,

  /// default auto archive duration for newly created threads changed
  ///
  /// Object changed: channel
  ///
  /// Type: [ThreadAutoArchiveDuration]
  @JsonValue('default_auto_archive_duration')
  defaultAutoArchiveDuration,

  /// default message notification level changed
  ///
  /// Object changed: guild
  ///
  /// Type: [DefaultMessageNotificationLevel]
  @JsonValue('default_message_notifications')
  defaultMessageNotifications,

  /// a permission on a text or voice channel was denied for a role
  ///
  /// Object changed: role
  ///
  /// Type: string
  deny,

  /// description changed
  ///
  /// Object changed: guild or sticker or guild scheduled event
  ///
  /// Type: string
  description,

  /// discovery splash changed
  ///
  /// Object changed: guild
  ///
  /// Type: string
  @JsonValue('discovery_splash_hash')
  discoverySplashHash,

  /// integration emoticons enabled/disabled
  ///
  /// Object changed: integration
  ///
  /// Type: boolean
  @JsonValue('enable_emoticons')
  enableEmoticons,

  /// entity type of guild scheduled event was changed
  ///
  /// Object changed: guild scheduled event
  ///
  /// Type: integer
  @JsonValue('entity_type')
  entityType,

  /// integration expiring subscriber behavior changed
  ///
  /// Object changed: integration
  ///
  /// Type: integer
  @JsonValue('expire_behavior')
  expireBehavior,

  /// integration expire grace period changed
  ///
  /// Object changed: integration
  ///
  /// Type: integer
  @JsonValue('expire_grace_period')
  expireGracePeriod,

  /// change in whose messages are scanned and deleted for explicit content in
  /// the server
  ///
  /// Object changed: guild
  ///
  /// Type: integer
  @JsonValue('explicit_content_filter')
  explicitContentFilter,

  /// format type of sticker changed
  ///
  /// Object changed: sticker
  ///
  /// Type: [StickerFormatType]
  @JsonValue('format_type')
  formatType,

  /// guild sticker is in changed
  ///
  /// Object changed: sticker
  ///
  /// Type: snowflake
  @JsonValue('guild_id')
  guildId,

  /// role is now displayed/no longer displayed separate from online users
  ///
  /// Object changed: role
  ///
  /// Type: bool
  hoist,

  /// icon changed
  ///
  /// Object changed: guild or role
  ///
  /// Type: string
  @JsonValue('icon_hash')
  iconHash,

  /// the id of the changed entity - sometimes used in conjunction with other
  /// keys
  ///
  /// Object changed: any
  ///
  /// Type: snowflake
  id,

  /// person who created invite code changed
  ///
  /// Object changed: invite
  ///
  /// Type: snowflake
  @JsonValue('inviter_id')
  inviterId,

  /// change in channel id for guild scheduled event
  ///
  /// Object changed: guild scheduled event
  ///
  /// Type: snowflake
  location,

  /// thread is now locked/unlocked
  ///
  /// Object changed: thread
  ///
  /// Type: bool
  locked,

  /// how long invite code lasts changed
  ///
  /// Object changed: invite
  ///
  /// Type: integer
  @JsonValue('max_age')
  maxAge,

  /// change to max number of times invite code can be used
  ///
  /// Object changed: invite
  ///
  /// Type: integer
  @JsonValue('max_uses')
  maxUses,

  /// role is now mentionable/unmentionable
  ///
  /// Object changed: role
  ///
  /// Type: bool
  mentionable,

  /// two-factor auth requirement changed
  ///
  /// Object changed: guild
  ///
  /// Type: integer
  @JsonValue('mfa_level')
  mfaLevel,

  /// user server muted/unmuted
  ///
  /// Object changed: user
  ///
  /// Type: boolean
  mute,

  /// name changed
  ///
  /// Object changed: any
  ///
  /// Type: string
  name,

  /// user nickname changed
  ///
  /// Object changed: user
  ///
  /// Type: string
  nick,

  /// channel nsfw restriction changed
  ///
  /// Object changed: channel
  ///
  /// Type: boolean
  nsfw,

  /// owner changed
  ///
  /// Object changed: guild
  ///
  /// Type: snowflake
  @JsonValue('owner_id')
  ownerId,

  /// permissions on a channel changed
  ///
  /// Object changed: channel
  ///
  /// Type: array of [Overwrite]
  @JsonValue('permission_overwrites')
  permissionOverwrites,

  /// permissions for a role changed
  ///
  /// Object changed: role
  ///
  /// Type: array of [Permission]
  permissions,

  /// text or voice channel position changed
  ///
  /// Object changed: channel
  ///
  /// Type: integer
  position,

  /// preferred locale changed
  ///
  /// Object changed: guild
  ///
  /// Type: string
  @JsonValue('preferred_locale')
  preferredLocale,

  /// privacy level of the stage instance changed
  ///
  /// Object changed: stage instance or guild scheduled event
  ///
  /// Type: [PrivacyLevel]
  @JsonValue('privacy_level')
  privacyLevel,

  /// change in number of days after which inactive and role-unassigned members
  /// are kicked
  ///
  /// Object changed: guild
  ///
  /// Type: integer
  @JsonValue('prune_delete_days')
  pruneDeleteDays,

  /// id of the public updates channel changed
  ///
  /// Object changed: guild
  ///
  /// Type: snowflake
  @JsonValue('public_updates_channel_id')
  publicUpdatesChannelId,

  /// amount of seconds a user has to wait before sending another message
  /// changed
  ///
  /// Object changed: channel
  ///
  /// Type: integer
  @JsonValue('rate_limit_per_user')
  rateLimitPerUser,

  /// region changed
  ///
  /// Object changed: guild
  ///
  /// Type: string
  region,

  /// id of the rules channel changed
  ///
  /// Object changed: guild
  ///
  /// Type: snowflake
  @JsonValue('rules_channel_id')
  rulesChannelId,

  /// invite splash page artwork changed
  ///
  /// Object changed: guild
  ///
  /// Type: string
  @JsonValue('splash_hash')
  splashHash,

  /// status of guild scheduled event was changed
  ///
  /// Object changed: guild scheduled event
  ///
  /// Type: [GuildScheduledEventStatus]
  status,

  /// id of the system channel changed
  ///
  /// Object changed: guild
  ///
  /// Type: snowflake
  @JsonValue('system_channel_id')

  /// related emoji of sticker changed
  ///
  /// Object changed: sticker
  /// Type: string
  tags,

  /// invite code is temporary/never expires
  ///
  /// Object changed: invite
  ///
  /// Type: bool
  temporary,

  /// text channel topic or stage instance topic changed
  ///
  /// Object changed: channel or stage instance
  ///
  /// Type: string
  topic,

  /// type of entity created
  ///
  /// Object changed: any
  ///
  /// Type: integer or string
  type,

  /// role unicode emoji changed
  ///
  /// Object changed: role
  ///
  /// Type: string
  @JsonValue('unicode_emoji')
  unicodeEmoji,

  /// new user limit in a voice channel
  ///
  /// Object changed: voice channel
  ///
  /// Type: integer
  @JsonValue('user_limit')
  userLimit,

  /// number of times invite code used changed
  ///
  /// Object changed: invite
  ///
  /// Type: integer
  uses,

  /// guild invite vanity url changed
  ///
  /// Object changed: guild
  ///
  /// Type: string
  @JsonValue('vanity_url_code')
  vanityUrlCode,

  /// required verification level changed
  ///
  /// Object changed: guild
  ///
  /// Type: [VerificationLevel]
  @JsonValue('verification_level')
  verificationLevel,

  /// channel id of the server widget changed
  ///
  /// Object changed: guild
  ///
  /// Type: snowflake
  @JsonValue('widget_channel_id')
  widgetChannelId,

  /// server widget enabled/disable
  ///
  /// Object changed: guild
  ///
  /// Type: boolean
  @JsonValue('widget_enabled')
  widgetEnabled,

  /// new role added
  ///
  /// Object changed: guild
  ///
  /// Type: array of partial [Role] objects
  @JsonValue('\$add')
  add,

  /// role removed
  ///
  /// Object changed: guild
  ///
  /// Type: array of partial [Role] objects
  @JsonValue('\$remove')
  remove,
}

/// Extension on [AuditLogChangeKey]
extension AuditLogChangeKeyExtension on AuditLogChangeKey {
  static const _enumMap = <AuditLogChangeKey, String>{
    AuditLogChangeKey.afkChannelId: 'afk_channel_id',
    AuditLogChangeKey.afkTimeout: 'afk_timeout',
    AuditLogChangeKey.allow: 'allow',
    AuditLogChangeKey.applicationId: 'application_id',
    AuditLogChangeKey.archived: 'archived',
    AuditLogChangeKey.asset: 'asset',
    AuditLogChangeKey.autoArchiveDuration: 'auto_archive_duration',
    AuditLogChangeKey.available: 'available',
    AuditLogChangeKey.avatarHash: 'avatar_hash',
    AuditLogChangeKey.bannerHash: 'banner_hash',
    AuditLogChangeKey.bitrate: 'bitrate',
    AuditLogChangeKey.channelId: 'channel_id',
    AuditLogChangeKey.code: 'code',
    AuditLogChangeKey.color: 'color',
    AuditLogChangeKey.deaf: 'deaf',
    AuditLogChangeKey.defaultAutoArchiveDuration:
        'default_auto_archive_duration',
    AuditLogChangeKey.defaultMessageNotifications:
        'default_message_notifications',
    AuditLogChangeKey.deny: 'deny',
    AuditLogChangeKey.description: 'description',
    AuditLogChangeKey.discoverySplashHash: 'discovery_splash_hash',
    AuditLogChangeKey.enableEmoticons: 'enable_emoticons',
    AuditLogChangeKey.entityType: 'entity_type',
    AuditLogChangeKey.expireBehavior: 'expire_behavior',
    AuditLogChangeKey.expireGracePeriod: 'expire_grace_period',
    AuditLogChangeKey.explicitContentFilter: 'explicit_content_filter',
    AuditLogChangeKey.formatType: 'format_type',
    AuditLogChangeKey.guildId: 'guild_id',
    AuditLogChangeKey.hoist: 'hoist',
    AuditLogChangeKey.iconHash: 'icon_hash',
    AuditLogChangeKey.id: 'id',
    AuditLogChangeKey.inviterId: 'inviter_id',
    AuditLogChangeKey.location: 'location',
    AuditLogChangeKey.locked: 'locked',
    AuditLogChangeKey.maxAge: 'max_age',
    AuditLogChangeKey.maxUses: 'max_uses',
    AuditLogChangeKey.mentionable: 'mentionable',
    AuditLogChangeKey.mfaLevel: 'mfa_level',
    AuditLogChangeKey.mute: 'mute',
    AuditLogChangeKey.name: 'name',
    AuditLogChangeKey.nick: 'nick',
    AuditLogChangeKey.nsfw: 'nsfw',
    AuditLogChangeKey.ownerId: 'owner_id',
    AuditLogChangeKey.permissionOverwrites: 'permission_overwrites',
    AuditLogChangeKey.permissions: 'permissions',
    AuditLogChangeKey.position: 'position',
    AuditLogChangeKey.preferredLocale: 'preferred_locale',
    AuditLogChangeKey.privacyLevel: 'privacy_level',
    AuditLogChangeKey.pruneDeleteDays: 'prune_delete_days',
    AuditLogChangeKey.publicUpdatesChannelId: 'public_updates_channel_id',
    AuditLogChangeKey.rateLimitPerUser: 'rate_limit_per_user',
    AuditLogChangeKey.region: 'region',
    AuditLogChangeKey.rulesChannelId: 'rules_channel_id',
    AuditLogChangeKey.splashHash: 'splash_hash',
    AuditLogChangeKey.status: 'status',
    AuditLogChangeKey.tags: 'system_channel_id',
    AuditLogChangeKey.temporary: 'temporary',
    AuditLogChangeKey.topic: 'topic',
    AuditLogChangeKey.type: 'type',
    AuditLogChangeKey.unicodeEmoji: 'unicode_emoji',
    AuditLogChangeKey.userLimit: 'user_limit',
    AuditLogChangeKey.uses: 'uses',
    AuditLogChangeKey.vanityUrlCode: 'vanity_url_code',
    AuditLogChangeKey.verificationLevel: 'verification_level',
    AuditLogChangeKey.widgetChannelId: 'widget_channel_id',
    AuditLogChangeKey.widgetEnabled: 'widget_enabled',
    AuditLogChangeKey.add: r'$add',
    AuditLogChangeKey.remove: r'$remove',
  };

  /// Get the value of the enum
  String get value => _enumMap[this]!;

  /// Create a [AuditLogChangeKey] from a value
  static AuditLogChangeKey fromValue(String value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
