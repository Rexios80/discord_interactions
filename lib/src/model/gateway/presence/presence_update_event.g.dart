// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$PresenceUpdateEventToJson(PresenceUpdateEvent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  writeNotNull('guild_id', instance.guildId);
  writeNotNull('status', _$PresenceStatusEnumMap[instance.status]);
  writeNotNull('activities', instance.activities);
  writeNotNull('client_status', instance.clientStatus);
  return val;
}

const _$PresenceStatusEnumMap = {
  PresenceStatus.idle: 'idle',
  PresenceStatus.dnd: 'dnd',
  PresenceStatus.online: 'online',
  PresenceStatus.offline: 'offline',
};
