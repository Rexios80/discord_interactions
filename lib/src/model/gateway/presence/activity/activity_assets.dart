// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'activity_assets.g.dart';

/// Activity Assets structure
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-assets
@JsonSerializable()
class ActivityAssets {
  /// the id for a large asset of the activity, usually a snowflake
  @JsonKey(name: 'large_image')
  final String? largeImage;

  /// text displayed when hovering over the large image of the activity
  @JsonKey(name: 'large_text')
  final String? largeText;

  /// the id for a small asset of the activity, usually a snowflake
  @JsonKey(name: 'small_image')
  final String? smallImage;

  /// text displayed when hovering over the small image of the activity
  @JsonKey(name: 'small_text')
  final String? smallText;

  /// Constructor
  ActivityAssets({
    this.largeImage,
    this.largeText,
    this.smallImage,
    this.smallText,
  });

  /// From json
  factory ActivityAssets.fromJson(Map<String, dynamic> json) =>
      _$ActivityAssetsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ActivityAssetsToJson(this);
}
