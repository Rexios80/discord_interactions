// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'sticker_pack.g.dart';

/// Sticker Pack structure
///
/// https://discord.com/developers/docs/resources/sticker#sticker-pack-object-sticker-pack-structure
@JsonSerializable(includeIfNull: false)
class StickerPack {
  /// id of the sticker pack
  final String id;

  /// the stickers in the pack
  final List<Sticker> stickers;

  /// name of the sticker pack
  final String name;

  /// id of the pack's SKU
  @JsonKey(name: 'sku_id')
  final String skuId;

  /// id of a sticker in the pack which is shown as the pack's icon
  @JsonKey(name: 'cover_sticker_id')
  final String? coverStickerId;

  /// description of the sticker pack
  final String description;

  /// id of the sticker pack's banner image
  @JsonKey(name: 'banner_asset_id')
  final String bannerAssetId;

  /// Constructor
  StickerPack({
    required this.id,
    required this.stickers,
    required this.name,
    required this.skuId,
    this.coverStickerId,
    required this.description,
    required this.bannerAssetId,
  });

  /// From json
  factory StickerPack.fromJson(Map<String, dynamic> json) =>
      _$StickerPackFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$StickerPackToJson(this);
}
