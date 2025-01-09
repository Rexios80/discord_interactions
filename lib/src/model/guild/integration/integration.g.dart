// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      expireGracePeriod: (json['expire_grace_period'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      account:
          IntegrationAccount.fromJson(json['account'] as Map<String, dynamic>),
      syncedAt: json['synced_at'] == null
          ? null
          : DateTime.parse(json['synced_at'] as String),
      subscriberCount: (json['subscriber_count'] as num?)?.toInt(),
      revoked: json['revoked'] as bool?,
      application: json['application'] == null
          ? null
          : IntegrationApplication.fromJson(
              json['application'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntegrationToJson(Integration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$IntegrationTypeEnumMap[instance.type]!,
      'enabled': instance.enabled,
      if (instance.syncing case final value?) 'syncing': value,
      if (instance.roleId case final value?) 'role_id': value,
      if (instance.enableEmoticons case final value?) 'enable_emoticons': value,
      if (_$IntegrationExpireBehaviorEnumMap[instance.expireBehavior]
          case final value?)
        'expireBehavior': value,
      if (instance.expireGracePeriod case final value?)
        'expire_grace_period': value,
      if (instance.user case final value?) 'user': value,
      'account': instance.account,
      if (instance.syncedAt?.toIso8601String() case final value?)
        'synced_at': value,
      if (instance.subscriberCount case final value?) 'subscriber_count': value,
      if (instance.revoked case final value?) 'revoked': value,
      if (instance.application case final value?) 'application': value,
    };

const _$IntegrationTypeEnumMap = {
  IntegrationType.twitch: 'twitch',
  IntegrationType.youtube: 'youtube',
  IntegrationType.discord: 'discord',
};

const _$IntegrationExpireBehaviorEnumMap = {
  IntegrationExpireBehavior.removeRole: 0,
  IntegrationExpireBehavior.kick: 1,
};
