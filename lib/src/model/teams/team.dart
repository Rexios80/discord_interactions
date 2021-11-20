// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/teams/team_member.dart';

part 'team.g.dart';

/// Team object
///
/// https://discord.com/developers/docs/topics/teams#data-models-team-object
@JsonSerializable()
class Team {
  /// a hash of the image of the team's icon
  final String? icon;

  /// the unique id of the team
  final int id;

  /// the members of the team
  final List<TeamMember> members;

  /// the name of the team
  final String name;

  /// the user id of the current team owner
  @JsonKey(name: 'owner_user_id')
  final String ownerUserId;

  /// Constructor
  Team({
    this.icon,
    required this.id,
    required this.members,
    required this.name,
    required this.ownerUserId,
  });

  /// From json
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
