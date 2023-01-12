// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$ListThreadsResponseToJson(ListThreadsResponse instance) {
  final val = <String, dynamic>{
    'threads': instance.threads,
    'members': instance.members,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('has_more', instance.hasMore);
  return val;
}
