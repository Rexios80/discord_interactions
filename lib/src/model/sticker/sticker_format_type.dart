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
