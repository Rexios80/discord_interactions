// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      sortValue: (json['sort_value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'id': instance.id,
      if (instance.packId case final value?) 'pack_id': value,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.tags case final value?) 'tags': value,
      if (_$StickerTypeEnumMap[instance.type] case final value?) 'type': value,
      'format_type': _$StickerFormatTypeEnumMap[instance.formatType]!,
      if (instance.available case final value?) 'available': value,
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.user case final value?) 'user': value,
      if (instance.sortValue case final value?) 'sort_value': value,
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
