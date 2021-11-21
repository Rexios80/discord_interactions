// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientStatus _$ClientStatusFromJson(Map<String, dynamic> json) => ClientStatus(
      desktop: $enumDecodeNullable(_$PresenceStatusEnumMap, json['desktop']),
      mobile: $enumDecodeNullable(_$PresenceStatusEnumMap, json['mobile']),
      web: $enumDecodeNullable(_$PresenceStatusEnumMap, json['web']),
    );

Map<String, dynamic> _$ClientStatusToJson(ClientStatus instance) =>
    <String, dynamic>{
      'desktop': _$PresenceStatusEnumMap[instance.desktop],
      'mobile': _$PresenceStatusEnumMap[instance.mobile],
      'web': _$PresenceStatusEnumMap[instance.web],
    };

const _$PresenceStatusEnumMap = {
  PresenceStatus.idle: 'idle',
  PresenceStatus.dnd: 'dnd',
  PresenceStatus.online: 'online',
  PresenceStatus.offline: 'offline',
};
