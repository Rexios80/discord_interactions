// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'interaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionResponse _$InteractionResponseFromJson(Map<String, dynamic> json) =>
    InteractionResponse(
      type: $enumDecode(_$InteractionCallbackTypeEnumMap, json['type']),
      data: json['data'] == null
          ? null
          : InteractionCallbackData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InteractionResponseToJson(
        InteractionResponse instance) =>
    <String, dynamic>{
      'type': _$InteractionCallbackTypeEnumMap[instance.type]!,
      if (instance.data case final value?) 'data': value,
    };

const _$InteractionCallbackTypeEnumMap = {
  InteractionCallbackType.pong: 1,
  InteractionCallbackType.channelMessageWithSource: 4,
  InteractionCallbackType.deferredChannelMessageWithSource: 5,
  InteractionCallbackType.deferredUpdateMessage: 6,
  InteractionCallbackType.updateMessage: 7,
  InteractionCallbackType.applicationCommandAutocompleteResult: 8,
};
