// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildTemplate _$GuildTemplateFromJson(Map<String, dynamic> json) =>
    GuildTemplate(
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      usageCount: json['usage_count'] as int,
      creatorId: json['creator_id'] as String,
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      sourceGuildId: json['source_guild_id'] as String,
      serializedSourceGuild: Guild.fromJson(
          json['serialized_source_guild'] as Map<String, dynamic>),
      isDirty: json['is_dirty'] as bool?,
    );

Map<String, dynamic> _$GuildTemplateToJson(GuildTemplate instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['usage_count'] = instance.usageCount;
  val['creator_id'] = instance.creatorId;
  val['creator'] = instance.creator;
  val['created_at'] = instance.createdAt.toIso8601String();
  val['updated_at'] = instance.updatedAt.toIso8601String();
  val['source_guild_id'] = instance.sourceGuildId;
  val['serialized_source_guild'] = instance.serializedSourceGuild;
  writeNotNull('is_dirty', instance.isDirty);
  return val;
}
