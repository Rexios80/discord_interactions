// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'embed_thumbnail.g.dart';

/// Embed Thumbnail structure
/// 
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-thumbnail-structure
@JsonSerializable()
class EmbedThumbnail {
  /// source url of thumbnail (only supports http(s) and attachments)
  final String url;

  /// a proxied url of the thumbnail
  @JsonKey(name: 'proxy_url')
  final String? proxyUrl;

  /// height of thumbnail
  final int? height;

  /// width of thumbnail
  final int? width;

  /// Constructor
  EmbedThumbnail({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  /// From json
  factory EmbedThumbnail.fromJson(Map<String, dynamic> json) =>
      _$EmbedThumbnailFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedThumbnailToJson(this);
}
