// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageActivity _$MessageActivityFromJson(Map<String, dynamic> json) =>
    MessageActivity(
      type: $enumDecode(_$MessageActivityTypeEnumMap, json['type']),
      partyId: json['party_id'] as String?,
    );

Map<String, dynamic> _$MessageActivityToJson(MessageActivity instance) {
  final val = <String, dynamic>{
    'type': _$MessageActivityTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('party_id', instance.partyId);
  return val;
}

const _$MessageActivityTypeEnumMap = {
  MessageActivityType.join: 1,
  MessageActivityType.spectate: 2,
  MessageActivityType.listen: 3,
  MessageActivityType.joinRequest: 5,
};
