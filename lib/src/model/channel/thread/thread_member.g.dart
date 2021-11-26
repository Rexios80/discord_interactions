// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadMember _$ThreadMemberFromJson(Map<String, dynamic> json) => ThreadMember(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      joinTimestamp: DateTime.parse(json['join_timestamp'] as String),
      flags: json['flags'] as int,
    );

Map<String, dynamic> _$ThreadMemberToJson(ThreadMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  val['join_timestamp'] = instance.joinTimestamp.toIso8601String();
  val['flags'] = instance.flags;
  return val;
}
