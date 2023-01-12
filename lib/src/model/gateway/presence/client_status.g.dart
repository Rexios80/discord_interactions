// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'client_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientStatus _$ClientStatusFromJson(Map<String, dynamic> json) => ClientStatus(
      desktop: $enumDecodeNullable(_$PresenceStatusEnumMap, json['desktop']),
      mobile: $enumDecodeNullable(_$PresenceStatusEnumMap, json['mobile']),
      web: $enumDecodeNullable(_$PresenceStatusEnumMap, json['web']),
    );

Map<String, dynamic> _$ClientStatusToJson(ClientStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('desktop', _$PresenceStatusEnumMap[instance.desktop]);
  writeNotNull('mobile', _$PresenceStatusEnumMap[instance.mobile]);
  writeNotNull('web', _$PresenceStatusEnumMap[instance.web]);
  return val;
}

const _$PresenceStatusEnumMap = {
  PresenceStatus.idle: 'idle',
  PresenceStatus.dnd: 'dnd',
  PresenceStatus.online: 'online',
  PresenceStatus.offline: 'offline',
};
