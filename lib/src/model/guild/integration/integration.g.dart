// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Integration _$IntegrationFromJson(Map<String, dynamic> json) => Integration(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$IntegrationTypeEnumMap, json['type']),
      enabled: json['enabled'] as bool,
      syncing: json['syncing'] as bool?,
      roleId: json['role_id'] as String?,
      enableEmoticons: json['enable_emoticons'] as bool?,
      expireBehavior: $enumDecodeNullable(
          _$IntegrationExpireBehaviorEnumMap, json['expireBehavior']),
      expireGracePeriod: json['expire_grace_period'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      account:
          IntegrationAccount.fromJson(json['account'] as Map<String, dynamic>),
      syncedAt: json['synced_at'] == null
          ? null
          : DateTime.parse(json['synced_at'] as String),
      subscriberCount: json['subscriber_count'] as int?,
      revoked: json['revoked'] as bool?,
      application: json['application'] == null
          ? null
          : IntegrationApplication.fromJson(
              json['application'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntegrationToJson(Integration instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'type': _$IntegrationTypeEnumMap[instance.type],
    'enabled': instance.enabled,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('syncing', instance.syncing);
  writeNotNull('role_id', instance.roleId);
  writeNotNull('enable_emoticons', instance.enableEmoticons);
  writeNotNull('expireBehavior',
      _$IntegrationExpireBehaviorEnumMap[instance.expireBehavior]);
  writeNotNull('expire_grace_period', instance.expireGracePeriod);
  writeNotNull('user', instance.user);
  val['account'] = instance.account;
  writeNotNull('synced_at', instance.syncedAt?.toIso8601String());
  writeNotNull('subscriber_count', instance.subscriberCount);
  writeNotNull('revoked', instance.revoked);
  writeNotNull('application', instance.application);
  return val;
}

const _$IntegrationTypeEnumMap = {
  IntegrationType.twitch: 'twitch',
  IntegrationType.youtube: 'youtube',
  IntegrationType.discord: 'discord',
};

const _$IntegrationExpireBehaviorEnumMap = {
  IntegrationExpireBehavior.removeRole: 0,
  IntegrationExpireBehavior.kick: 1,
};
