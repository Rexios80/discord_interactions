// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadMember _$ThreadMemberFromJson(Map<String, dynamic> json) => ThreadMember(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      joinTimestamp:
          const ISO8601Converter().fromJson(json['join_timestamp'] as String),
      flags: json['flags'] as int,
    );

Map<String, dynamic> _$ThreadMemberToJson(ThreadMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'join_timestamp': const ISO8601Converter().toJson(instance.joinTimestamp),
      'flags': instance.flags,
    };
