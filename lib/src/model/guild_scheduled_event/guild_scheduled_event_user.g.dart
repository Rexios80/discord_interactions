// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'guild_scheduled_event_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildScheduledEventUser _$GuildScheduledEventUserFromJson(
        Map<String, dynamic> json) =>
    GuildScheduledEventUser(
      guildScheduledEventId: json['guild_scheduled_event_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GuildScheduledEventUserToJson(
        GuildScheduledEventUser instance) =>
    <String, dynamic>{
      'guild_scheduled_event_id': instance.guildScheduledEventId,
      'user': instance.user,
      if (instance.member case final value?) 'member': value,
    };
