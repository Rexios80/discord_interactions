// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'guild_template.g.dart';

/// Guild Template structure
///
/// https://discord.com/developers/docs/resources/guild-template#guild-template-object-guild-template-structure
@JsonSerializable(includeIfNull: false)
class GuildTemplate {
  /// the template code (unique ID)
  final String code;

  /// template name
  final String name;

  /// the description for the template
  final String? description;

  /// number of times this template has been used
  @JsonKey(name: 'usage_count')
  final int usageCount;

  /// the ID of the user who created the template
  @JsonKey(name: 'creator_id')
  final String creatorId;

  /// the user who created the template
  final User creator;

  /// when this template was created
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// when this template was last synced to the source guild
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// the ID of the guild this template is based on
  @JsonKey(name: 'source_guild_id')
  final String sourceGuildId;

  /// the guild snapshot this template contains
  @JsonKey(name: 'serialized_source_guild')
  final Guild serializedSourceGuild;

  /// whether the template has unsynced changes
  @JsonKey(name: 'is_dirty')
  final bool? isDirty;

  /// Constructor
  GuildTemplate({
    required this.code,
    required this.name,
    this.description,
    required this.usageCount,
    required this.creatorId,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.sourceGuildId,
    required this.serializedSourceGuild,
    this.isDirty,
  });

  /// From json
  factory GuildTemplate.fromJson(Map<String, dynamic> json) =>
      _$GuildTemplateFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildTemplateToJson(this);
}
