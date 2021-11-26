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
      flags: const ApplicationFlagConverter().fromJson(json['flags'] as int?),
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) {
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
  val['description'] = instance.description;
  writeNotNull('rpc_origins', instance.rpcOrigins);
  val['bot_public'] = instance.botPublic;
  val['bot_require_code_grant'] = instance.botRequireCodeGrant;
  writeNotNull('terms_of_service_url', instance.termsOfServiceUrl);
  writeNotNull('privacy_policy_url', instance.privacyPolicyUrl);
  writeNotNull('owner', instance.owner);
  val['summary'] = instance.summary;
  val['verify_key'] = instance.verifyKey;
  writeNotNull('team', instance.team);
  writeNotNull('guild_id', instance.guildId);
  writeNotNull('primary_sku_id', instance.primarySkuId);
  writeNotNull('slug', instance.slug);
  writeNotNull('cover_image', instance.coverImage);
  writeNotNull(
      'flags', const ApplicationFlagConverter().toJson(instance.flags));
  return val;
}
