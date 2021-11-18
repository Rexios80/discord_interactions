import 'package:discord_interactions/src/model/teams/membership_state.dart';
import 'package:discord_interactions/src/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_member.g.dart';

/// Team Member object
@JsonSerializable()
class TeamMember {
  /// the user's membership state on the team
  @JsonKey(name: 'membership_state')
  final MembershipState membershipState;

  /// will always be ["*"]
  final List<String> permissions;

  /// the id of the parent team of which they are a member
  @JsonKey(name: 'team_id')
  final String teamId;

  /// the avatar, discriminator, id, and username of the user
  final User user;

  /// Constructor
  TeamMember({
    required this.membershipState,
    required this.permissions,
    required this.teamId,
    required this.user,
  });

  /// From json
  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$TeamMemberToJson(this);
}
