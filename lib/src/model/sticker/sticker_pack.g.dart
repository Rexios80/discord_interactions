// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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

Map<String, dynamic> _$StickerPackToJson(StickerPack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stickers': instance.stickers,
      'name': instance.name,
      'sku_id': instance.skuId,
      if (instance.coverStickerId case final value?) 'cover_sticker_id': value,
      'description': instance.description,
      'banner_asset_id': instance.bannerAssetId,
    };
