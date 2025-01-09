// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      if (instance.hasMore case final value?) 'has_more': value,
    };
