// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerItem _$StickerItemFromJson(Map<String, dynamic> json) => StickerItem(
      id: json['id'] as String,
      name: json['name'] as String,
      formatType: $enumDecode(_$StickerFormatTypeEnumMap, json['format_type']),
    );

Map<String, dynamic> _$StickerItemToJson(StickerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'format_type': _$StickerFormatTypeEnumMap[instance.formatType],
    };

const _$StickerFormatTypeEnumMap = {
  StickerFormatType.png: 1,
  StickerFormatType.apng: 2,
  StickerFormatType.lottie: 3,
};
