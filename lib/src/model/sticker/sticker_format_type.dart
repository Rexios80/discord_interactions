// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Sticker Format types
///
/// https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-format-types
enum StickerFormatType {
  /// png
  @JsonValue(1)
  png,

  /// apng
  @JsonValue(2)
  apng,

  /// lottie
  @JsonValue(3)
  lottie,
}

/// Extension on [StickerFormatType]
extension StickerFormatTypeExtension on StickerFormatType {
  static const _enumMap = <StickerFormatType, int>{
    StickerFormatType.png: 1,
    StickerFormatType.apng: 2,
    StickerFormatType.lottie: 3,
  };

  /// Get the int value of the enum
  int get value => _enumMap[this]!;

  /// Create a [StickerFormatType] from an [int]
  static StickerFormatType fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
