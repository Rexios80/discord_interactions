// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'team_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMember _$TeamMemberFromJson(Map<String, dynamic> json) => TeamMember(
      membershipState:
          $enumDecode(_$MembershipStateEnumMap, json['membership_state']),
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      teamId: json['team_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamMemberToJson(TeamMember instance) =>
    <String, dynamic>{
      'membership_state': _$MembershipStateEnumMap[instance.membershipState]!,
      'permissions': instance.permissions,
      'team_id': instance.teamId,
      'user': instance.user,
    };

const _$MembershipStateEnumMap = {
  MembershipState.invited: 1,
  MembershipState.accepted: 2,
};
