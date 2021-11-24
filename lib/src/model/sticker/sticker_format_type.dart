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
  /// Create a [StickerFormatType] from an [int]
  static StickerFormatType fromValue(int value) {
    switch (value) {
      case 1:
        return StickerFormatType.png;
      case 2:
        return StickerFormatType.apng;
      case 3:
        return StickerFormatType.lottie;
      default:
        throw ArgumentError('Unknown sticker format type: $value');
    }
  }
}
