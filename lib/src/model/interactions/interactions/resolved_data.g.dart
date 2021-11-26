// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolved_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResolvedData _$ResolvedDataFromJson(Map<String, dynamic> json) => ResolvedData(
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, User.fromJson(e as Map<String, dynamic>)),
      ),
      members: (json['members'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, GuildMember.fromJson(e as Map<String, dynamic>)),
      ),
      roles: (json['roles'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Role.fromJson(e as Map<String, dynamic>)),
      ),
      channels: (json['channels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Channel.fromJson(e as Map<String, dynamic>)),
      ),
      messages: (json['messages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Message.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ResolvedDataToJson(ResolvedData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('users', instance.users);
  writeNotNull('members', instance.members);
  writeNotNull('roles', instance.roles);
  writeNotNull('channels', instance.channels);
  writeNotNull('messages', instance.messages);
  return val;
}
