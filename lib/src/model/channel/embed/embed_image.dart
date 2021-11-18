import 'package:json_annotation/json_annotation.dart';

part 'embed_image.g.dart';

/// Embed Image structure
@JsonSerializable()
class EmbedImage {
  /// source url of image (only supports http(s) and attachments)
  final String url;

  /// a proxied url of the image
  @JsonKey(name: 'proxy_url')
  final String proxyUrl;

  /// height of image
  final int? height;

  /// width of image
  final int? width;

  /// Constructor
  EmbedImage({
    required this.url,
    required this.proxyUrl,
    this.height,
    this.width,
  });

  /// From json
  factory EmbedImage.fromJson(Map<String, dynamic> json) =>
      _$EmbedImageFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedImageToJson(this);
}
