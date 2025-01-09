// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'allowed_mentions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllowedMentions _$AllowedMentionsFromJson(Map<String, dynamic> json) =>
    AllowedMentions(
      parse: (json['parse'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AllowedMentionTypeEnumMap, e))
          .toList(),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
      repliedUser: json['replied_user'] as bool?,
    );

Map<String, dynamic> _$AllowedMentionsToJson(AllowedMentions instance) =>
    <String, dynamic>{
      if (instance.parse?.map((e) => _$AllowedMentionTypeEnumMap[e]!).toList()
          case final value?)
        'parse': value,
      if (instance.roles case final value?) 'roles': value,
      if (instance.users case final value?) 'users': value,
      if (instance.repliedUser case final value?) 'replied_user': value,
    };

const _$AllowedMentionTypeEnumMap = {
  AllowedMentionType.roles: 'roles',
  AllowedMentionType.users: 'users',
  AllowedMentionType.everyone: 'everyone',
};
