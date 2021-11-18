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

Map<String, dynamic> _$EmbedVideoToJson(EmbedVideo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'proxy_url': instance.proxyUrl,
      'height': instance.height,
      'width': instance.width,
    };
