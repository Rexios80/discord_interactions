// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_threads_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListThreadsResponse _$ListThreadsResponseFromJson(Map<String, dynamic> json) =>
    ListThreadsResponse(
      threads: (json['threads'] as List<dynamic>)
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>)
          .map((e) => ThreadMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
    );

Map<String, dynamic> _$ListThreadsResponseToJson(
        ListThreadsResponse instance) =>
    <String, dynamic>{
      'threads': instance.threads,
      'members': instance.members,
      'has_more': instance.hasMore,
    };
