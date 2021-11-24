// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sticker _$StickerFromJson(Map<String, dynamic> json) => Sticker(
      id: json['id'] as String,
      packId: json['pack_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      tags: json['tags'] as String?,
      type: $enumDecodeNullable(_$StickerTypeEnumMap, json['type']),
      formatType: $enumDecode(_$StickerFormatTypeEnumMap, json['format_type']),
      available: json['available'] as bool?,
      guildId: json['guild_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      sortValue: json['sort_value'] as int?,
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'id': instance.id,
      'pack_id': instance.packId,
      'name': instance.name,
      'description': instance.description,
      'tags': instance.tags,
      'type': _$StickerTypeEnumMap[instance.type],
      'format_type': _$StickerFormatTypeEnumMap[instance.formatType],
      'available': instance.available,
      'guild_id': instance.guildId,
      'user': instance.user,
      'sort_value': instance.sortValue,
    };

const _$StickerTypeEnumMap = {
  StickerType.standard: 1,
  StickerType.guild: 2,
};

const _$StickerFormatTypeEnumMap = {
  StickerFormatType.png: 1,
  StickerFormatType.apng: 2,
  StickerFormatType.lottie: 3,
};
