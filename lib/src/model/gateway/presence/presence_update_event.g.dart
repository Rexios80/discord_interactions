// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence_update_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresenceUpdateEvent _$PresenceUpdateEventFromJson(Map<String, dynamic> json) =>
    PresenceUpdateEvent(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      guildId: json['guild_id'] as String?,
      status: $enumDecodeNullable(_$PresenceStatusEnumMap, json['status']),
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientStatus: json['client_status'],
    );

Map<String, dynamic> _$PresenceUpdateEventToJson(
        PresenceUpdateEvent instance) =>
    <String, dynamic>{
      'user': instance.user,
      'guild_id': instance.guildId,
      'status': _$PresenceStatusEnumMap[instance.status],
      'activities': instance.activities,
      'client_status': instance.clientStatus,
    };

const _$PresenceStatusEnumMap = {
  PresenceStatus.idle: 'idle',
  PresenceStatus.dnd: 'dnd',
  PresenceStatus.online: 'online',
  PresenceStatus.offline: 'offline',
};
