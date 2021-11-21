// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Sticker types
///
/// https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-types
enum StickerType {
  /// an official sticker in a pack, part of Nitro or in a removed purchasable pack
  @JsonValue(1)
  standard,

  /// a sticker uploaded to a Boosted guild for the guild's members
  @JsonValue(2)
  guild,
}
