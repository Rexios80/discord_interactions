// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      if (instance.user case final value?) 'user': value,
      if (instance.nick case final value?) 'nick': value,
      if (instance.avatar case final value?) 'avatar': value,
      'roles': instance.roles,
      'joined_at': instance.joinedAt.toIso8601String(),
      if (instance.premiumSince?.toIso8601String() case final value?)
        'premium_since': value,
      if (instance.deaf case final value?) 'deaf': value,
      if (instance.mute case final value?) 'mute': value,
      if (instance.pending case final value?) 'pending': value,
      if (const PermissionConverterNullable().toJson(instance.permissions)
          case final value?)
        'permissions': value,
    };
