// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invite _$InviteFromJson(Map<String, dynamic> json) => Invite(
      code: json['code'] as String,
      guild: json['guild'] == null
          ? null
          : Guild.fromJson(json['guild'] as Map<String, dynamic>),
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
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
      expiresAt: const ISO8601ConverterNullable()
          .fromJson(json['expires_at'] as String?),
      stageInstance: json['stage_instance'] == null
          ? null
          : InviteStageInstance.fromJson(
              json['stage_instance'] as Map<String, dynamic>),
      guildScheduledEvent: json['guild_scheduled_event'] == null
          ? null
          : GuildScheduledEvent.fromJson(
              json['guild_scheduled_event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InviteToJson(Invite instance) => <String, dynamic>{
      'code': instance.code,
      'guild': instance.guild,
      'channel': instance.channel,
      'inviter': instance.inviter,
      'target_type': _$InviteTargetTypeEnumMap[instance.targetType],
      'target_user': instance.targetUser,
      'target_application': instance.targetApplication,
      'approximate_presence_count': instance.approximatePresenceCount,
      'approximate_member_count': instance.approximateMemberCount,
      'expires_at': const ISO8601ConverterNullable().toJson(instance.expiresAt),
      'stage_instance': instance.stageInstance,
      'guild_scheduled_event': instance.guildScheduledEvent,
    };

const _$InviteTargetTypeEnumMap = {
  InviteTargetType.stream: 1,
  InviteTargetType.embeddedApplication: 2,
};
