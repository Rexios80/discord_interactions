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
      permissions:
          const PermissionConverter().fromJson(json['permissions'] as String),
      managed: json['managed'] as bool,
      mentionable: json['mentionable'] as bool,
      tags: json['tags'] == null
          ? null
          : RoleTags.fromJson(json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoleToJson(Role instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'color': instance.color,
    'hoist': instance.hoist,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon', instance.icon);
  writeNotNull('unicode_emoji', instance.unicodeEmoji);
  val['position'] = instance.position;
  val['permissions'] = const PermissionConverter().toJson(instance.permissions);
  val['managed'] = instance.managed;
  val['mentionable'] = instance.mentionable;
  writeNotNull('tags', instance.tags);
  return val;
}
