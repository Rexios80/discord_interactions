// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerPack _$StickerPackFromJson(Map<String, dynamic> json) => StickerPack(
      id: json['id'] as String,
      stickers: (json['stickers'] as List<dynamic>)
          .map((e) => Sticker.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      skuId: json['sku_id'] as String,
      coverStickerId: json['cover_sticker_id'] as String?,
      description: json['description'] as String,
      bannerAssetId: json['banner_asset_id'] as String,
    );

Map<String, dynamic> _$StickerPackToJson(StickerPack instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'stickers': instance.stickers,
    'name': instance.name,
    'sku_id': instance.skuId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cover_sticker_id', instance.coverStickerId);
  val['description'] = instance.description;
  val['banner_asset_id'] = instance.bannerAssetId;
  return val;
}
