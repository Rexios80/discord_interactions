// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) => Emoji(
      id: json['id'] as String?,
      name: json['name'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      requireColons: json['require_colons'] as bool?,
      managed: json['managed'] as bool?,
      animated: json['animated'] as bool?,
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$EmojiToJson(Emoji instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('roles', instance.roles);
  writeNotNull('user', instance.user);
  writeNotNull('require_colons', instance.requireColons);
  writeNotNull('managed', instance.managed);
  writeNotNull('animated', instance.animated);
  writeNotNull('available', instance.available);
  return val;
}
