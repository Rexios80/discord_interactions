// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'embed_video.g.dart';

/// Embed Video structure
///
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-video-structure
@JsonSerializable()
class EmbedVideo {
  /// source url of video
  final String? url;

  /// a proxied url of the video
  @JsonKey(name: 'proxy_url')
  final String? proxyUrl;

  /// height of video
  final int? height;

  /// width of video
  final int? width;

  /// Constructor
  EmbedVideo({
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  /// From json
  factory EmbedVideo.fromJson(Map<String, dynamic> json) =>
      _$EmbedVideoFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedVideoToJson(this);
}
