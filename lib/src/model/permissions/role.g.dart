// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as int,
      hoist: json['hoist'] as bool,
      icon: json['icon'] as String?,
      unicodeEmoji: json['unicode_emoji'] as String?,
      position: json['position'] as int,
      permissions: json['permissions'] as String,
      managed: json['managed'] as bool,
      mentionable: json['mentionable'] as bool,
      tags: json['tags'] == null
          ? null
          : RoleTags.fromJson(json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'hoist': instance.hoist,
      'icon': instance.icon,
      'unicode_emoji': instance.unicodeEmoji,
      'position': instance.position,
      'permissions': instance.permissions,
      'managed': instance.managed,
      'mentionable': instance.mentionable,
      'tags': instance.tags,
    };
