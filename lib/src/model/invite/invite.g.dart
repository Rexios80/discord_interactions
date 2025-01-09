// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invite _$InviteFromJson(Map<String, dynamic> json) => Invite(
      code: json['code'] as String?,
      guild: json['guild'] == null
          ? null
          : Guild.fromJson(json['guild'] as Map<String, dynamic>),
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
      inviter: json['inviter'] == null
          ? null
          : User.fromJson(json['inviter'] as Map<String, dynamic>),
      targetType:
          $enumDecodeNullable(_$InviteTargetTypeEnumMap, json['target_type']),
      targetUser: json['target_user'] == null
          ? null
          : User.fromJson(json['target_user'] as Map<String, dynamic>),
      targetApplication: json['target_application'] == null
          ? null
          : Application.fromJson(
              json['target_application'] as Map<String, dynamic>),
      approximatePresenceCount:
          (json['approximate_presence_count'] as num?)?.toInt(),
      approximateMemberCount:
          (json['approximate_member_count'] as num?)?.toInt(),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      stageInstance: json['stage_instance'] == null
          ? null
          : InviteStageInstance.fromJson(
              json['stage_instance'] as Map<String, dynamic>),
      guildScheduledEvent: json['guild_scheduled_event'] == null
          ? null
          : GuildScheduledEvent.fromJson(
              json['guild_scheduled_event'] as Map<String, dynamic>),
      uses: (json['uses'] as num?)?.toInt(),
      maxUses: (json['max_uses'] as num?)?.toInt(),
      maxAge: (json['max_age'] as num?)?.toInt(),
      temporary: json['temporary'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$InviteToJson(Invite instance) => <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.guild case final value?) 'guild': value,
      if (instance.channel case final value?) 'channel': value,
      if (instance.inviter case final value?) 'inviter': value,
      if (_$InviteTargetTypeEnumMap[instance.targetType] case final value?)
        'target_type': value,
      if (instance.targetUser case final value?) 'target_user': value,
      if (instance.targetApplication case final value?)
        'target_application': value,
      if (instance.approximatePresenceCount case final value?)
        'approximate_presence_count': value,
      if (instance.approximateMemberCount case final value?)
        'approximate_member_count': value,
      if (instance.expiresAt?.toIso8601String() case final value?)
        'expires_at': value,
      if (instance.stageInstance case final value?) 'stage_instance': value,
      if (instance.guildScheduledEvent case final value?)
        'guild_scheduled_event': value,
      if (instance.uses case final value?) 'uses': value,
      if (instance.maxUses case final value?) 'max_uses': value,
      if (instance.maxAge case final value?) 'max_age': value,
      if (instance.temporary case final value?) 'temporary': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
    };

const _$InviteTargetTypeEnumMap = {
  InviteTargetType.stream: 1,
  InviteTargetType.embeddedApplication: 2,
};
