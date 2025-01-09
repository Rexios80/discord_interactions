// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'guild_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildPreview _$GuildPreviewFromJson(Map<String, dynamic> json) => GuildPreview(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      splash: json['splash'] as String?,
      discoverySplash: json['discovery_splash'] as String?,
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>)
          .map((e) => $enumDecode(_$GuildFeatureEnumMap, e))
          .toList(),
      approximateMemberCount: (json['approximate_member_count'] as num).toInt(),
      approximatePresenceCount:
          (json['approximate_presence_count'] as num).toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GuildPreviewToJson(GuildPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.icon case final value?) 'icon': value,
      if (instance.splash case final value?) 'splash': value,
      if (instance.discoverySplash case final value?) 'discovery_splash': value,
      if (instance.emojis case final value?) 'emojis': value,
      'features':
          instance.features.map((e) => _$GuildFeatureEnumMap[e]!).toList(),
      'approximate_member_count': instance.approximateMemberCount,
      'approximate_presence_count': instance.approximatePresenceCount,
      if (instance.description case final value?) 'description': value,
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
