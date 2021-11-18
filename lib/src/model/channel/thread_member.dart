import 'package:discord_interactions/src/converter/iso8601_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thread_member.g.dart';

/// A thread member is used to indicate whether a user has joined a thread or not.
@JsonSerializable()
class ThreadMember {
  /// the id of the thread
  ///
  /// These fields are ommitted on the member sent within each thread in the GUILD_CREATE event
  final String? id;

  /// the id of the user
  ///
  /// These fields are ommitted on the member sent within each thread in the GUILD_CREATE event
  @JsonKey(name: 'user_id')
  final String? userId;

  /// the time the current user last joined the thread
  @ISO8601Converter()
  @JsonKey(name: 'join_timestamp')
  final DateTime joinTimestamp;

  /// any user-thread settings, currently only used for notifications
  final int flags;

  /// Constructor
  ThreadMember({
    this.id,
    this.userId,
    required this.joinTimestamp,
    required this.flags,
  });

  /// From json
  factory ThreadMember.fromJson(Map<String, dynamic> json) =>
      _$ThreadMemberFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ThreadMemberToJson(this);
}
