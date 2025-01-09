// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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

Map<String, dynamic> _$ResolvedDataToJson(ResolvedData instance) =>
    <String, dynamic>{
      if (instance.users case final value?) 'users': value,
      if (instance.members case final value?) 'members': value,
      if (instance.roles case final value?) 'roles': value,
      if (instance.channels case final value?) 'channels': value,
      if (instance.messages case final value?) 'messages': value,
    };
