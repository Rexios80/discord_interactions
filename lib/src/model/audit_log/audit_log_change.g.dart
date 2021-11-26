// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditLogChange _$AuditLogChangeFromJson(Map<String, dynamic> json) =>
    AuditLogChange(
      newValue: json['new_value'],
      oldValue: json['old_value'],
      key: $enumDecode(_$AuditLogChangeKeyEnumMap, json['key']),
    );

Map<String, dynamic> _$AuditLogChangeToJson(AuditLogChange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('new_value', instance.newValue);
  writeNotNull('old_value', instance.oldValue);
  val['key'] = _$AuditLogChangeKeyEnumMap[instance.key];
  return val;
}

const _$AuditLogChangeKeyEnumMap = {
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
  AuditLogChangeKey.defaultAutoArchiveDuration: 'default_auto_archive_duration',
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
