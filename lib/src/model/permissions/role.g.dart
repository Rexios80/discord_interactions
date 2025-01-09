// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as String,
      name: json['name'] as String,
      color: (json['color'] as num).toInt(),
      hoist: json['hoist'] as bool,
      icon: json['icon'] as String?,
      unicodeEmoji: json['unicode_emoji'] as String?,
      position: (json['position'] as num).toInt(),
      permissions:
          const PermissionConverter().fromJson(json['permissions'] as String),
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
      if (instance.icon case final value?) 'icon': value,
      if (instance.unicodeEmoji case final value?) 'unicode_emoji': value,
      'position': instance.position,
      'permissions': const PermissionConverter().toJson(instance.permissions),
      'managed': instance.managed,
      'mentionable': instance.mentionable,
      if (instance.tags case final value?) 'tags': value,
    };
