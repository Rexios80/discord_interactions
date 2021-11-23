// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildMember _$GuildMemberFromJson(Map<String, dynamic> json) => GuildMember(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      nick: json['nick'] as String?,
      avatar: json['avatar'] as String?,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      joinedAt: DateTime.parse(json['joined_at'] as String),
      premiumSince: json['premium_since'] == null
          ? null
          : DateTime.parse(json['premium_since'] as String),
      deaf: json['deaf'] as bool?,
      mute: json['mute'] as bool?,
      pending: json['pending'] as bool?,
      permissions: const PermissionConverterNullable()
          .fromJson(json['permissions'] as String?),
    );

Map<String, dynamic> _$GuildMemberToJson(GuildMember instance) =>
    <String, dynamic>{
      'user': instance.user,
      'nick': instance.nick,
      'avatar': instance.avatar,
      'roles': instance.roles,
      'joined_at': instance.joinedAt.toIso8601String(),
      'premium_since': instance.premiumSince?.toIso8601String(),
      'deaf': instance.deaf,
      'mute': instance.mute,
      'pending': instance.pending,
      'permissions':
          const PermissionConverterNullable().toJson(instance.permissions),
    };
