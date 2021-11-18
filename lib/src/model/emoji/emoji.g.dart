// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) => Emoji(
      id: json['id'] as String?,
      name: json['name'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: json['user'],
      requireColons: json['require_colons'] as bool?,
      managed: json['managed'] as bool?,
      animated: json['animated'] as bool?,
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$EmojiToJson(Emoji instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roles': instance.roles,
      'user': instance.user,
      'require_colons': instance.requireColons,
      'managed': instance.managed,
      'animated': instance.animated,
      'available': instance.available,
    };
