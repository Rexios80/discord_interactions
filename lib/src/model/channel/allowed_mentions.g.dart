// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$AllowedMentionsToJson(AllowedMentions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parse',
      instance.parse?.map((e) => _$AllowedMentionTypeEnumMap[e]!).toList());
  writeNotNull('roles', instance.roles);
  writeNotNull('users', instance.users);
  writeNotNull('replied_user', instance.repliedUser);
  return val;
}

const _$AllowedMentionTypeEnumMap = {
  AllowedMentionType.roles: 'roles',
  AllowedMentionType.users: 'users',
  AllowedMentionType.everyone: 'everyone',
};
