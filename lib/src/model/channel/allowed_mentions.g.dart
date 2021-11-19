// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allowed_mentions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllowedMentions _$AllowedMentionsFromJson(Map<String, dynamic> json) =>
    AllowedMentions(
      parse: (json['parse'] as List<dynamic>)
          .map((e) => $enumDecode(_$AllowedMentionTypeEnumMap, e))
          .toList(),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
      repliedUser: json['replied_user'] as bool?,
    );

Map<String, dynamic> _$AllowedMentionsToJson(AllowedMentions instance) =>
    <String, dynamic>{
      'parse':
          instance.parse.map((e) => _$AllowedMentionTypeEnumMap[e]).toList(),
      'roles': instance.roles,
      'users': instance.users,
      'replied_user': instance.repliedUser,
    };

const _$AllowedMentionTypeEnumMap = {
  AllowedMentionType.roles: 'roles',
  AllowedMentionType.users: 'users',
  AllowedMentionType.everyone: 'everyone',
};
