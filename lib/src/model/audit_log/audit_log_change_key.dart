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
  static const _enumMap = {
    'afk_channel_id': AuditLogChangeKey.afkChannelId,
    'afk_timeout': AuditLogChangeKey.afkTimeout,
    'allow': AuditLogChangeKey.allow,
    'application_id': AuditLogChangeKey.applicationId,
    'archived': AuditLogChangeKey.archived,
    'asset': AuditLogChangeKey.asset,
    'auto_archive_duration': AuditLogChangeKey.autoArchiveDuration,
    'available': AuditLogChangeKey.available,
    'avatar_hash': AuditLogChangeKey.avatarHash,
    'banner_hash': AuditLogChangeKey.bannerHash,
    'bitrate': AuditLogChangeKey.bitrate,
    'channel_id': AuditLogChangeKey.channelId,
    'code': AuditLogChangeKey.code,
    'color': AuditLogChangeKey.color,
    'deaf': AuditLogChangeKey.deaf,
    'default_auto_archive_duration':
        AuditLogChangeKey.defaultAutoArchiveDuration,
    'default_message_notifications':
        AuditLogChangeKey.defaultMessageNotifications,
    'deny': AuditLogChangeKey.deny,
    'description': AuditLogChangeKey.description,
    'discovery_splash_hash': AuditLogChangeKey.discoverySplashHash,
    'enable_emoticons': AuditLogChangeKey.enableEmoticons,
    'entity_type': AuditLogChangeKey.entityType,
    'expire_behavior': AuditLogChangeKey.expireBehavior,
    'expire_grace_period': AuditLogChangeKey.expireGracePeriod,
    'explicit_content_filter': AuditLogChangeKey.explicitContentFilter,
    'format_type': AuditLogChangeKey.formatType,
    'guild_id': AuditLogChangeKey.guildId,
    'hoist': AuditLogChangeKey.hoist,
    'icon_hash': AuditLogChangeKey.iconHash,
    'id': AuditLogChangeKey.id,
    'inviter_id': AuditLogChangeKey.inviterId,
    'location': AuditLogChangeKey.location,
    'locked': AuditLogChangeKey.locked,
    'max_age': AuditLogChangeKey.maxAge,
    'max_uses': AuditLogChangeKey.maxUses,
    'mentionable': AuditLogChangeKey.mentionable,
    'mfa_level': AuditLogChangeKey.mfaLevel,
    'mute': AuditLogChangeKey.mute,
    'name': AuditLogChangeKey.name,
    'nick': AuditLogChangeKey.nick,
    'nsfw': AuditLogChangeKey.nsfw,
    'owner_id': AuditLogChangeKey.ownerId,
    'permission_overwrites': AuditLogChangeKey.permissionOverwrites,
    'permissions': AuditLogChangeKey.permissions,
    'position': AuditLogChangeKey.position,
    'preferred_locale': AuditLogChangeKey.preferredLocale,
    'privacy_level': AuditLogChangeKey.privacyLevel,
    'prune_delete_days': AuditLogChangeKey.pruneDeleteDays,
    'public_updates_channel_id': AuditLogChangeKey.publicUpdatesChannelId,
    'rate_limit_per_user': AuditLogChangeKey.rateLimitPerUser,
    'region': AuditLogChangeKey.region,
    'rules_channel_id': AuditLogChangeKey.rulesChannelId,
    'splash_hash': AuditLogChangeKey.splashHash,
    'status': AuditLogChangeKey.status,
    'system_channel_id': AuditLogChangeKey.tags,
    'temporary': AuditLogChangeKey.temporary,
    'topic': AuditLogChangeKey.topic,
    'type': AuditLogChangeKey.type,
    'unicode_emoji': AuditLogChangeKey.unicodeEmoji,
    'user_limit': AuditLogChangeKey.userLimit,
    'uses': AuditLogChangeKey.uses,
    'vanity_url_code': AuditLogChangeKey.vanityUrlCode,
    'verification_level': AuditLogChangeKey.verificationLevel,
    'widget_channel_id': AuditLogChangeKey.widgetChannelId,
    'widget_enabled': AuditLogChangeKey.widgetEnabled,
    r'$add': AuditLogChangeKey.add,
    r'$remove': AuditLogChangeKey.remove,
  };

  /// Converts a string to an [AuditLogChangeKey]
  static AuditLogChangeKey fromValue(String value) => _enumMap[value]!;
}
