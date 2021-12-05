// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guild _$GuildFromJson(Map<String, dynamic> json) => Guild(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      iconHash: json['icon_hash'] as String?,
      splash: json['splash'] as String?,
      discoverySplash: json['discovery_splash'] as String?,
      owner: json['owner'] as bool?,
      ownerId: json['ownerId'] as String?,
      permissions: const PermissionConverterNullable()
          .fromJson(json['permissions'] as String?),
      afkChannelId: json['afk_channel_id'] as String?,
      afkTimeout: json['afk_timeout'] as int?,
      widgetEnabled: json['widget_enabled'] as bool?,
      widgetChannelId: json['widget_channel_id'] as String?,
      verificationLevel: $enumDecodeNullable(
          _$VerificationLevelEnumMap, json['verification_level']),
      defaultMessageNotifications: $enumDecodeNullable(
          _$DefaultMessageNotificationLevelEnumMap,
          json['default_message_notifications']),
      explicitContentFilter: $enumDecodeNullable(
          _$ExplicitContentFilterLevelEnumMap, json['explicit_content_filter']),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$GuildFeatureEnumMap, e))
          .toList(),
      mfaLevel: $enumDecodeNullable(_$MfaLevelEnumMap, json['mfa_level']),
      applicationId: json['application_id'] as String?,
      systemChannelId: json['system_channel_id'] as String?,
      systemChannelFlags: const SystemChannelFlagConverter()
          .fromJson(json['system_channel_flags'] as int?),
      rulesChannelId: json['rules_channel_id'] as String?,
      joinedAt: json['joined_at'] == null
          ? null
          : DateTime.parse(json['joined_at'] as String),
      large: json['large'] as bool?,
      unavailable: json['unavailable'] as bool?,
      memberCount: json['member_count'] as int?,
      voiceStates: (json['voice_states'] as List<dynamic>?)
          ?.map((e) => VoiceState.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => GuildMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      threads: (json['threads'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      presences: (json['presences'] as List<dynamic>?)
          ?.map((e) => PresenceUpdateEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxPresences: json['max_presences'] as int?,
      maxMembers: json['max_members'] as int?,
      vanityUrlCode: json['vanity_url_code'] as String?,
      description: json['description'] as String?,
      banner: json['banner'] as String?,
      premiumTier:
          $enumDecodeNullable(_$PremiumTierEnumMap, json['premium_tier']),
      premiumSubscriptionCount: json['premium_subscription_count'] as int?,
      preferredLocale: json['preferred_locale'] as String?,
      publicUpdatesChannelId: json['public_updates_channel_id'] as String?,
      maxVideoChannelUsers: json['max_video_channel_users'] as int?,
      approximateMemberCount: json['approximate_member_count'] as int?,
      approximatePresenceCount: json['approximate_presence_count'] as int?,
      welcomeScreen: json['welcome_screen'] == null
          ? null
          : WelcomeScreen.fromJson(
              json['welcome_screen'] as Map<String, dynamic>),
      nsfwLevel:
          $enumDecodeNullable(_$GuildNsfwLevelEnumMap, json['nsfw_level']),
      stageInstances: (json['stage_instances'] as List<dynamic>?)
          ?.map((e) => StageInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      stickers: (json['stickers'] as List<dynamic>?)
          ?.map((e) => Sticker.fromJson(e as Map<String, dynamic>))
          .toList(),
      guildScheduledEvents: (json['guild_scheduled_events'] as List<dynamic>?)
          ?.map((e) => GuildScheduledEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      premiumProgressBarEnabled: json['premium_progress_bar_enabled'] as bool?,
    );

Map<String, dynamic> _$GuildToJson(Guild instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon', instance.icon);
  writeNotNull('icon_hash', instance.iconHash);
  writeNotNull('splash', instance.splash);
  writeNotNull('discovery_splash', instance.discoverySplash);
  writeNotNull('owner', instance.owner);
  writeNotNull('ownerId', instance.ownerId);
  writeNotNull('permissions',
      const PermissionConverterNullable().toJson(instance.permissions));
  writeNotNull('afk_channel_id', instance.afkChannelId);
  writeNotNull('afk_timeout', instance.afkTimeout);
  writeNotNull('widget_enabled', instance.widgetEnabled);
  writeNotNull('widget_channel_id', instance.widgetChannelId);
  writeNotNull('verification_level',
      _$VerificationLevelEnumMap[instance.verificationLevel]);
  writeNotNull(
      'default_message_notifications',
      _$DefaultMessageNotificationLevelEnumMap[
          instance.defaultMessageNotifications]);
  writeNotNull('explicit_content_filter',
      _$ExplicitContentFilterLevelEnumMap[instance.explicitContentFilter]);
  writeNotNull('roles', instance.roles);
  writeNotNull('emojis', instance.emojis);
  writeNotNull('features',
      instance.features?.map((e) => _$GuildFeatureEnumMap[e]).toList());
  writeNotNull('mfa_level', _$MfaLevelEnumMap[instance.mfaLevel]);
  writeNotNull('application_id', instance.applicationId);
  writeNotNull('system_channel_id', instance.systemChannelId);
  writeNotNull('system_channel_flags',
      const SystemChannelFlagConverter().toJson(instance.systemChannelFlags));
  writeNotNull('rules_channel_id', instance.rulesChannelId);
  writeNotNull('joined_at', instance.joinedAt?.toIso8601String());
  writeNotNull('large', instance.large);
  writeNotNull('unavailable', instance.unavailable);
  writeNotNull('member_count', instance.memberCount);
  writeNotNull('voice_states', instance.voiceStates);
  writeNotNull('members', instance.members);
  writeNotNull('channels', instance.channels);
  writeNotNull('threads', instance.threads);
  writeNotNull('presences', instance.presences);
  writeNotNull('max_presences', instance.maxPresences);
  writeNotNull('max_members', instance.maxMembers);
  writeNotNull('vanity_url_code', instance.vanityUrlCode);
  writeNotNull('description', instance.description);
  writeNotNull('banner', instance.banner);
  writeNotNull('premium_tier', _$PremiumTierEnumMap[instance.premiumTier]);
  writeNotNull('premium_subscription_count', instance.premiumSubscriptionCount);
  writeNotNull('preferred_locale', instance.preferredLocale);
  writeNotNull('public_updates_channel_id', instance.publicUpdatesChannelId);
  writeNotNull('max_video_channel_users', instance.maxVideoChannelUsers);
  writeNotNull('approximate_member_count', instance.approximateMemberCount);
  writeNotNull('approximate_presence_count', instance.approximatePresenceCount);
  writeNotNull('welcome_screen', instance.welcomeScreen);
  writeNotNull('nsfw_level', _$GuildNsfwLevelEnumMap[instance.nsfwLevel]);
  writeNotNull('stage_instances', instance.stageInstances);
  writeNotNull('stickers', instance.stickers);
  writeNotNull('guild_scheduled_events', instance.guildScheduledEvents);
  writeNotNull(
      'premium_progress_bar_enabled', instance.premiumProgressBarEnabled);
  return val;
}

const _$VerificationLevelEnumMap = {
  VerificationLevel.none: 0,
  VerificationLevel.low: 1,
  VerificationLevel.medium: 2,
  VerificationLevel.high: 3,
  VerificationLevel.veryHigh: 4,
};

const _$DefaultMessageNotificationLevelEnumMap = {
  DefaultMessageNotificationLevel.allMessages: 0,
  DefaultMessageNotificationLevel.onlyMentions: 1,
};

const _$ExplicitContentFilterLevelEnumMap = {
  ExplicitContentFilterLevel.disabled: 0,
  ExplicitContentFilterLevel.membersWithoutRoles: 1,
  ExplicitContentFilterLevel.allMembers: 2,
};

const _$GuildFeatureEnumMap = {
  GuildFeature.animatedIcon: 'ANIMATED_ICON',
  GuildFeature.banner: 'BANNER',
  GuildFeature.commerce: 'COMMERCE',
  GuildFeature.community: 'COMMUNITY',
  GuildFeature.discoverable: 'DISCOVERABLE',
  GuildFeature.featurable: 'FEATURABLE',
  GuildFeature.inviteSplash: 'INVITE_SPLASH',
  GuildFeature.memberVerificationGateEnabled:
      'MEMBER_VERIFICATION_GATE_ENABLED',
  GuildFeature.monetizationEnabled: 'MONETIZATION_ENABLED',
  GuildFeature.moreStickers: 'MORE_STICKERS',
  GuildFeature.news: 'NEWS',
  GuildFeature.partnered: 'PARTNERED',
  GuildFeature.previewEnabled: 'PREVIEW_ENABLED',
  GuildFeature.privateThreads: 'PRIVATE_THREADS',
  GuildFeature.roleIcons: 'ROLE_ICONS',
  GuildFeature.sevenDayThreadArchive: 'SEVEN_DAY_THREAD_ARCHIVE',
  GuildFeature.threeDayThreadArchive: 'THREE_DAY_THREAD_ARCHIVE',
  GuildFeature.ticketedEventsEnabled: 'TICKETED_EVENTS_ENABLED',
  GuildFeature.vanityUrl: 'VANITY_URL',
  GuildFeature.verified: 'VERIFIED',
  GuildFeature.vipRegions: 'VIP_REGIONS',
  GuildFeature.welcomeScreenEnabled: 'WELCOME_SCREEN_ENABLED',
};

const _$MfaLevelEnumMap = {
  MfaLevel.none: 0,
  MfaLevel.elevated: 1,
};

const _$PremiumTierEnumMap = {
  PremiumTier.none: 0,
  PremiumTier.tier1: 1,
  PremiumTier.tier2: 2,
  PremiumTier.tier3: 3,
};

const _$GuildNsfwLevelEnumMap = {
  GuildNsfwLevel.defaultLevel: 0,
  GuildNsfwLevel.explicit: 1,
  GuildNsfwLevel.safe: 2,
  GuildNsfwLevel.ageRestricted: 3,
};
