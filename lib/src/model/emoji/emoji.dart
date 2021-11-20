// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'emoji.g.dart';

/// Emoji structure
/// 
/// Routes for controlling emojis do not follow the normal rate limit conventions.
/// These routes are specifically limited on a per-guild basis to prevent abuse.
/// This means that the quota returned by our APIs may be inaccurate, and you may encounter 429s.
/// 
/// https://discord.com/developers/docs/resources/emoji#emoji-object-emoji-structure
@JsonSerializable()
class Emoji {
  /// emoji id
  final String? id;

  /// emoji name
  ///
  /// (can be null only in reaction emoji objects)
  final String? name;

  /// roles allowed to use this emoji
  final List<String>? roles;

  /// user that created this emoji
  final User? user;

  /// whether this emoji must be wrapped in colons
  @JsonKey(name: 'require_colons')
  final bool? requireColons;

  /// whether this emoji is managed
  final bool? managed;

  /// whether this emoji is animated
  final bool? animated;

  /// whether this emoji can be used, may be false due to loss of Server Boosts
  final bool? available;

  /// Constructor
  Emoji({
    this.id,
    this.name,
    this.roles,
    this.user,
    this.requireColons,
    this.managed,
    this.animated,
    this.available,
  });

  /// From json
  factory Emoji.fromJson(Map<String, dynamic> json) => _$EmojiFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmojiToJson(this);
}
