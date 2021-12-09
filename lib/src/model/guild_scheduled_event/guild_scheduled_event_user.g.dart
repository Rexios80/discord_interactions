// GENERATED CODE - DO NOT MODIFY BY HAND

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
    GuildScheduledEventUser instance) {
  final val = <String, dynamic>{
    'guild_scheduled_event_id': instance.guildScheduledEventId,
    'user': instance.user,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('member', instance.member);
  return val;
}
