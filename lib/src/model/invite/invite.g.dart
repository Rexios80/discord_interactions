// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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
      approximatePresenceCount: json['approximate_presence_count'] as int?,
      approximateMemberCount: json['approximate_member_count'] as int?,
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
      uses: json['uses'] as int?,
      maxUses: json['max_uses'] as int?,
      maxAge: json['max_age'] as int?,
      temporary: json['temporary'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$InviteToJson(Invite instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('guild', instance.guild);
  writeNotNull('channel', instance.channel);
  writeNotNull('inviter', instance.inviter);
  writeNotNull('target_type', _$InviteTargetTypeEnumMap[instance.targetType]);
  writeNotNull('target_user', instance.targetUser);
  writeNotNull('target_application', instance.targetApplication);
  writeNotNull('approximate_presence_count', instance.approximatePresenceCount);
  writeNotNull('approximate_member_count', instance.approximateMemberCount);
  writeNotNull('expires_at', instance.expiresAt?.toIso8601String());
  writeNotNull('stage_instance', instance.stageInstance);
  writeNotNull('guild_scheduled_event', instance.guildScheduledEvent);
  writeNotNull('uses', instance.uses);
  writeNotNull('max_uses', instance.maxUses);
  writeNotNull('max_age', instance.maxAge);
  writeNotNull('temporary', instance.temporary);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  return val;
}

const _$InviteTargetTypeEnumMap = {
  InviteTargetType.stream: 1,
  InviteTargetType.embeddedApplication: 2,
};
