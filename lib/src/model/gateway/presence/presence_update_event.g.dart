// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      clientStatus: json['client_status'] == null
          ? null
          : ClientStatus.fromJson(
              json['client_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresenceUpdateEventToJson(
        PresenceUpdateEvent instance) =>
    <String, dynamic>{
      if (instance.user case final value?) 'user': value,
      if (instance.guildId case final value?) 'guild_id': value,
      if (_$PresenceStatusEnumMap[instance.status] case final value?)
        'status': value,
      if (instance.activities case final value?) 'activities': value,
      if (instance.clientStatus case final value?) 'client_status': value,
    };

const _$PresenceStatusEnumMap = {
  PresenceStatus.idle: 'idle',
  PresenceStatus.dnd: 'dnd',
  PresenceStatus.online: 'online',
  PresenceStatus.offline: 'offline',
};
