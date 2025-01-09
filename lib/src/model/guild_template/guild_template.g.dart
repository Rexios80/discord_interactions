// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'guild_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildTemplate _$GuildTemplateFromJson(Map<String, dynamic> json) =>
    GuildTemplate(
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      usageCount: (json['usage_count'] as num).toInt(),
      creatorId: json['creator_id'] as String,
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      sourceGuildId: json['source_guild_id'] as String,
      serializedSourceGuild: Guild.fromJson(
          json['serialized_source_guild'] as Map<String, dynamic>),
      isDirty: json['is_dirty'] as bool?,
    );

Map<String, dynamic> _$GuildTemplateToJson(GuildTemplate instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      'usage_count': instance.usageCount,
      'creator_id': instance.creatorId,
      'creator': instance.creator,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'source_guild_id': instance.sourceGuildId,
      'serialized_source_guild': instance.serializedSourceGuild,
      if (instance.isDirty case final value?) 'is_dirty': value,
    };
