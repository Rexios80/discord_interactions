// GENERATED CODE - DO NOT MODIFY BY HAND

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
      flags: json['flags'] as int?,
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'description': instance.description,
      'rpc_origins': instance.rpcOrigins,
      'bot_public': instance.botPublic,
      'bot_require_code_grant': instance.botRequireCodeGrant,
      'terms_of_service_url': instance.termsOfServiceUrl,
      'privacy_policy_url': instance.privacyPolicyUrl,
      'owner': instance.owner,
      'summary': instance.summary,
      'verify_key': instance.verifyKey,
      'team': instance.team,
      'guild_id': instance.guildId,
      'primary_sku_id': instance.primarySkuId,
      'slug': instance.slug,
      'cover_image': instance.coverImage,
      'flags': instance.flags,
    };
