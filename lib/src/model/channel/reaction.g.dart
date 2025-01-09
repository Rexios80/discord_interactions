// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reaction _$ReactionFromJson(Map<String, dynamic> json) => Reaction(
      count: (json['count'] as num).toInt(),
      me: json['me'] as bool,
      emoji: Emoji.fromJson(json['emoji'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReactionToJson(Reaction instance) => <String, dynamic>{
      'count': instance.count,
      'me': instance.me,
      'emoji': instance.emoji,
    };
