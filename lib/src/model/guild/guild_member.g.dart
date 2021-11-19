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
      joinedAt: const ISO8601Converter().fromJson(json['joined_at'] as String),
      premiumSince: const ISO8601ConverterNullable()
          .fromJson(json['premium_since'] as String?),
      deaf: json['deaf'] as bool?,
      mute: json['mute'] as bool?,
      pending: json['pending'] as bool?,
      permissions: json['permissions'] as String?,
    );

Map<String, dynamic> _$GuildMemberToJson(GuildMember instance) =>
    <String, dynamic>{
      'user': instance.user,
      'nick': instance.nick,
      'avatar': instance.avatar,
      'roles': instance.roles,
      'joined_at': const ISO8601Converter().toJson(instance.joinedAt),
      'premium_since':
          const ISO8601ConverterNullable().toJson(instance.premiumSince),
      'deaf': instance.deaf,
      'mute': instance.mute,
      'pending': instance.pending,
      'permissions': instance.permissions,
    };
