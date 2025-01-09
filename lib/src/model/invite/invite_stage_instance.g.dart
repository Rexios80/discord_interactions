// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'invite_stage_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteStageInstance _$InviteStageInstanceFromJson(Map<String, dynamic> json) =>
    InviteStageInstance(
      members: (json['members'] as List<dynamic>)
          .map((e) => GuildMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      participantCount: (json['participant_count'] as num).toInt(),
      speakerCount: (json['speaker_count'] as num).toInt(),
      topic: json['topic'] as String,
    );

Map<String, dynamic> _$InviteStageInstanceToJson(
        InviteStageInstance instance) =>
    <String, dynamic>{
      'members': instance.members,
      'participant_count': instance.participantCount,
      'speaker_count': instance.speakerCount,
      'topic': instance.topic,
    };
