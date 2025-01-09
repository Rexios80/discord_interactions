// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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

Map<String, dynamic> _$EmojiToJson(Emoji instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.roles case final value?) 'roles': value,
      if (instance.user case final value?) 'user': value,
      if (instance.requireColons case final value?) 'require_colons': value,
      if (instance.managed case final value?) 'managed': value,
      if (instance.animated case final value?) 'animated': value,
      if (instance.available case final value?) 'available': value,
    };
