// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'thread_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadMember _$ThreadMemberFromJson(Map<String, dynamic> json) => ThreadMember(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      joinTimestamp: DateTime.parse(json['join_timestamp'] as String),
      flags: (json['flags'] as num).toInt(),
    );

Map<String, dynamic> _$ThreadMemberToJson(ThreadMember instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.userId case final value?) 'user_id': value,
      'join_timestamp': instance.joinTimestamp.toIso8601String(),
      'flags': instance.flags,
    };
