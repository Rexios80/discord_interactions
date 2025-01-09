// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      afkTimeout: (json['afk_timeout'] as num?)?.toInt(),
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
          .fromJson((json['system_channel_flags'] as num?)?.toInt()),
      rulesChannelId: json['rules_channel_id'] as String?,
      joinedAt: json['joined_at'] == null
          ? null
          : DateTime.parse(json['joined_at'] as String),
      large: json['large'] as bool?,
      unavailable: json['unavailable'] as bool?,
      memberCount: (json['member_count'] as num?)?.toInt(),
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
      maxPresences: (json['max_presences'] as num?)?.toInt(),
      maxMembers: (json['max_members'] as num?)?.toInt(),
      vanityUrlCode: json['vanity_url_code'] as String?,
      description: json['description'] as String?,
      banner: json['banner'] as String?,
      premiumTier:
          $enumDecodeNullable(_$PremiumTierEnumMap, json['premium_tier']),
      premiumSubscriptionCount:
          (json['premium_subscription_count'] as num?)?.toInt(),
      preferredLocale: json['preferred_locale'] as String?,
      publicUpdatesChannelId: json['public_updates_channel_id'] as String?,
      maxVideoChannelUsers: (json['max_video_channel_users'] as num?)?.toInt(),
      approximateMemberCount:
          (json['approximate_member_count'] as num?)?.toInt(),
      approximatePresenceCount:
          (json['approximate_presence_count'] as num?)?.toInt(),
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

Map<String, dynamic> _$GuildToJson(Guild instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.icon case final value?) 'icon': value,
      if (instance.iconHash case final value?) 'icon_hash': value,
      if (instance.splash case final value?) 'splash': value,
      if (instance.discoverySplash case final value?) 'discovery_splash': value,
      if (instance.owner case final value?) 'owner': value,
      if (instance.ownerId case final value?) 'ownerId': value,
      if (const PermissionConverterNullable().toJson(instance.permissions)
          case final value?)
        'permissions': value,
      if (instance.afkChannelId case final value?) 'afk_channel_id': value,
      if (instance.afkTimeout case final value?) 'afk_timeout': value,
      if (instance.widgetEnabled case final value?) 'widget_enabled': value,
      if (instance.widgetChannelId case final value?)
        'widget_channel_id': value,
      if (_$VerificationLevelEnumMap[instance.verificationLevel]
          case final value?)
        'verification_level': value,
      if (_$DefaultMessageNotificationLevelEnumMap[
              instance.defaultMessageNotifications]
          case final value?)
        'default_message_notifications': value,
      if (_$ExplicitContentFilterLevelEnumMap[instance.explicitContentFilter]
          case final value?)
        'explicit_content_filter': value,
      if (instance.roles case final value?) 'roles': value,
      if (instance.emojis case final value?) 'emojis': value,
      if (instance.features?.map((e) => _$GuildFeatureEnumMap[e]!).toList()
          case final value?)
        'features': value,
      if (_$MfaLevelEnumMap[instance.mfaLevel] case final value?)
        'mfa_level': value,
      if (instance.applicationId case final value?) 'application_id': value,
      if (instance.systemChannelId case final value?)
        'system_channel_id': value,
      if (const SystemChannelFlagConverter().toJson(instance.systemChannelFlags)
          case final value?)
        'system_channel_flags': value,
      if (instance.rulesChannelId case final value?) 'rules_channel_id': value,
      if (instance.joinedAt?.toIso8601String() case final value?)
        'joined_at': value,
      if (instance.large case final value?) 'large': value,
      if (instance.unavailable case final value?) 'unavailable': value,
      if (instance.memberCount case final value?) 'member_count': value,
      if (instance.voiceStates case final value?) 'voice_states': value,
      if (instance.members case final value?) 'members': value,
      if (instance.channels case final value?) 'channels': value,
      if (instance.threads case final value?) 'threads': value,
      if (instance.presences case final value?) 'presences': value,
      if (instance.maxPresences case final value?) 'max_presences': value,
      if (instance.maxMembers case final value?) 'max_members': value,
      if (instance.vanityUrlCode case final value?) 'vanity_url_code': value,
      if (instance.description case final value?) 'description': value,
      if (instance.banner case final value?) 'banner': value,
      if (_$PremiumTierEnumMap[instance.premiumTier] case final value?)
        'premium_tier': value,
      if (instance.premiumSubscriptionCount case final value?)
        'premium_subscription_count': value,
      if (instance.preferredLocale case final value?) 'preferred_locale': value,
      if (instance.publicUpdatesChannelId case final value?)
        'public_updates_channel_id': value,
      if (instance.maxVideoChannelUsers case final value?)
        'max_video_channel_users': value,
      if (instance.approximateMemberCount case final value?)
        'approximate_member_count': value,
      if (instance.approximatePresenceCount case final value?)
        'approximate_presence_count': value,
      if (instance.welcomeScreen case final value?) 'welcome_screen': value,
      if (_$GuildNsfwLevelEnumMap[instance.nsfwLevel] case final value?)
        'nsfw_level': value,
      if (instance.stageInstances case final value?) 'stage_instances': value,
      if (instance.stickers case final value?) 'stickers': value,
      if (instance.guildScheduledEvents case final value?)
        'guild_scheduled_events': value,
      if (instance.premiumProgressBarEnabled case final value?)
        'premium_progress_bar_enabled': value,
    };

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
