// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'sticker_item.g.dart';

/// The smallest amount of data required to render a sticker. A partial sticker object.
@JsonSerializable()
class StickerItem {
  /// id of the sticker
  final String id;

  /// name of the sticker
  final String name;

  /// type of sticker format
  @JsonKey(name: 'format_type')
  final StickerFormatType formatType;

  /// Constructor
  StickerItem({
    required this.id,
    required this.name,
    required this.formatType,
  });

  /// From json
  factory StickerItem.fromJson(Map<String, dynamic> json) =>
      _$StickerItemFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$StickerItemToJson(this);
}
