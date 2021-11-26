// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedVideo _$EmbedVideoFromJson(Map<String, dynamic> json) => EmbedVideo(
      url: json['url'] as String?,
      proxyUrl: json['proxy_url'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$EmbedVideoToJson(EmbedVideo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('proxy_url', instance.proxyUrl);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  return val;
}
