// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      if (_$PresenceStatusEnumMap[instance.desktop] case final value?)
        'desktop': value,
      if (_$PresenceStatusEnumMap[instance.mobile] case final value?)
        'mobile': value,
      if (_$PresenceStatusEnumMap[instance.web] case final value?) 'web': value,
    };

const _$PresenceStatusEnumMap = {
  PresenceStatus.idle: 'idle',
  PresenceStatus.dnd: 'dnd',
  PresenceStatus.online: 'online',
  PresenceStatus.offline: 'offline',
};
