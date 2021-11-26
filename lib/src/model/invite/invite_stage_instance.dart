// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'invite_stage_instance.g.dart';

/// Invite Stage Instance structure
///
/// https://discord.com/developers/docs/resources/invite#invite-stage-instance-object-invite-stage-instance-structure
@JsonSerializable(includeIfNull: false)
class InviteStageInstance {
  /// the members speaking in the Stage
  final List<GuildMember> members;

  /// the number of users in the Stage
  @JsonKey(name: 'participant_count')
  final int participantCount;

  /// the number of users speaking in the Stage
  @JsonKey(name: 'speaker_count')
  final int speakerCount;

  /// the topic of the Stage instance (1-120 characters)
  final String topic;

  /// Constructor
  InviteStageInstance({
    required this.members,
    required this.participantCount,
    required this.speakerCount,
    required this.topic,
  });

  /// From json
  factory InviteStageInstance.fromJson(Map<String, dynamic> json) =>
      _$InviteStageInstanceFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InviteStageInstanceToJson(this);
}
