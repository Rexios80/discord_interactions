// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'thread_member.g.dart';

/// Thread Member structure
///
/// A thread member is used to indicate whether a user has joined a thread or not.
///
/// https://discord.com/developers/docs/resources/channel#thread-member-object-thread-member-structure
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
