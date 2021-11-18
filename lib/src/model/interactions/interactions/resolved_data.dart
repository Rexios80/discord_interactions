import 'package:discord_interactions/src/model/channel/channel.dart';
import 'package:discord_interactions/src/model/guild/guild_member.dart';
import 'package:discord_interactions/src/model/channel/message.dart';
import 'package:discord_interactions/src/model/permissions/role.dart';
import 'package:discord_interactions/src/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resolved_data.g.dart';

/// If data for a Member is included, data for its corresponding User will also be included.
@JsonSerializable()
class ResolvedData {
  /// the ids and User objects
  final Map<String, User>? users;

  /// the ids and partial Member objects
  ///
  /// Partial Member objects are missing user, deaf and mute fields
  final Map<String, GuildMember>? members;

  /// the ids and Role objects
  final Map<String, Role>? roles;

  /// the ids and partial Channel objects
  ///
  /// Partial Channel objects only have id, name, type and permissions fields.
  /// Threads will also have thread_metadata and parent_id fields.
  final Map<String, Channel>? channels;

  /// the ids and partial Message objects
  final Map<String, Message>? messages;

  /// Create a [ResolvedData]
  ResolvedData({
    this.users,
    this.members,
    this.roles,
    this.channels,
    this.messages,
  });

  /// From json
  factory ResolvedData.fromJson(Map<String, dynamic> json) =>
      _$ResolvedDataFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ResolvedDataToJson(this);
}
