// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInteraction _$MessageInteractionFromJson(Map<String, dynamic> json) =>
    MessageInteraction(
      id: json['id'] as String,
      type: $enumDecode(_$InteractionTypeEnumMap, json['type']),
      name: json['name'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageInteractionToJson(MessageInteraction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$InteractionTypeEnumMap[instance.type]!,
      'name': instance.name,
      'user': instance.user,
    };

const _$InteractionTypeEnumMap = {
  InteractionType.ping: 1,
  InteractionType.applicationCommand: 2,
  InteractionType.messageComponent: 3,
  InteractionType.applicationCommandAutocomplete: 4,
};
