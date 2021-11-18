// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      icon: json['icon'] as String?,
      id: json['id'] as int,
      members: (json['members'] as List<dynamic>)
          .map((e) => TeamMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      ownerUserId: json['owner_user_id'] as String,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'icon': instance.icon,
      'id': instance.id,
      'members': instance.members,
      'name': instance.name,
      'owner_user_id': instance.ownerUserId,
    };
