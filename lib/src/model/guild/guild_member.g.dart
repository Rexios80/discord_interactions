// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$GuildMemberToJson(GuildMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  writeNotNull('nick', instance.nick);
  writeNotNull('avatar', instance.avatar);
  val['roles'] = instance.roles;
  val['joined_at'] = instance.joinedAt.toIso8601String();
  writeNotNull('premium_since', instance.premiumSince?.toIso8601String());
  writeNotNull('deaf', instance.deaf);
  writeNotNull('mute', instance.mute);
  writeNotNull('pending', instance.pending);
  writeNotNull('permissions',
      const PermissionConverterNullable().toJson(instance.permissions));
  return val;
}
