// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'message_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageActivity _$MessageActivityFromJson(Map<String, dynamic> json) =>
    MessageActivity(
      type: $enumDecode(_$MessageActivityTypeEnumMap, json['type']),
      partyId: json['party_id'] as String?,
    );

Map<String, dynamic> _$MessageActivityToJson(MessageActivity instance) =>
    <String, dynamic>{
      'type': _$MessageActivityTypeEnumMap[instance.type]!,
      if (instance.partyId case final value?) 'party_id': value,
    };

const _$MessageActivityTypeEnumMap = {
  MessageActivityType.join: 1,
  MessageActivityType.spectate: 2,
  MessageActivityType.listen: 3,
  MessageActivityType.joinRequest: 5,
};
