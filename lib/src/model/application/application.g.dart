// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      description: json['description'] as String,
      rpcOrigins: (json['rpc_origins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      botPublic: json['bot_public'] as bool,
      botRequireCodeGrant: json['bot_require_code_grant'] as bool,
      termsOfServiceUrl: json['terms_of_service_url'] as String?,
      privacyPolicyUrl: json['privacy_policy_url'] as String?,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      verifyKey: json['verify_key'] as String,
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      guildId: json['guild_id'] as String?,
      primarySkuId: json['primary_sku_id'] as String?,
      slug: json['slug'] as String?,
      coverImage: json['cover_image'] as String?,
      flags: const ApplicationFlagConverter()
          .fromJson((json['flags'] as num?)?.toInt()),
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.icon case final value?) 'icon': value,
      'description': instance.description,
      if (instance.rpcOrigins case final value?) 'rpc_origins': value,
      'bot_public': instance.botPublic,
      'bot_require_code_grant': instance.botRequireCodeGrant,
      if (instance.termsOfServiceUrl case final value?)
        'terms_of_service_url': value,
      if (instance.privacyPolicyUrl case final value?)
        'privacy_policy_url': value,
      if (instance.owner case final value?) 'owner': value,
      'summary': instance.summary,
      'verify_key': instance.verifyKey,
      if (instance.team case final value?) 'team': value,
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.primarySkuId case final value?) 'primary_sku_id': value,
      if (instance.slug case final value?) 'slug': value,
      if (instance.coverImage case final value?) 'cover_image': value,
      if (const ApplicationFlagConverter().toJson(instance.flags)
          case final value?)
        'flags': value,
    };
