// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'sticker.g.dart';

/// Sticker structure
///
/// https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-structure
@JsonSerializable()
class Sticker {
  /// id of the sticker
  final String id;

  /// for standard stickers, id of the pack the sticker is from
  @JsonKey(name: 'pack_id')
  final String? packId;

  /// name of the sticker
  final String name;

  /// description of the sticker
  final String? description;

  /// autocomplete/suggestion tags for the sticker (max 200 characters)
  ///
  /// A comma separated list of keywords is the format used in this field by
  /// standard stickers, but this is just a convention. Incidentally the client
  /// will always use a name generated from an emoji as the value of this field
  /// when creating or modifying a guild sticker.
  final String? tags;

  /// type of sticker
  final StickerType? type;

  /// type of sticker format
  @JsonKey(name: 'format_type')
  final StickerFormatType formatType;

  /// whether this guild sticker can be used, may be false due to loss of Server
  /// Boosts
  final bool? available;

  /// id of the guild that owns this sticker
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the user that uploaded the guild sticker
  final User? user;

  /// the standard sticker's sort order within its pack
  @JsonKey(name: 'sort_value')
  final int? sortValue;

  /// Constructor
  Sticker({
    required this.id,
    this.packId,
    required this.name,
    this.description,
    this.tags,
    this.type,
    required this.formatType,
    this.available,
    this.guildId,
    this.user,
    this.sortValue,
  });

  /// From json
  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
