// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'embed_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedVideo _$EmbedVideoFromJson(Map<String, dynamic> json) => EmbedVideo(
      url: json['url'] as String?,
      proxyUrl: json['proxy_url'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmbedVideoToJson(EmbedVideo instance) =>
    <String, dynamic>{
      if (instance.url case final value?) 'url': value,
      if (instance.proxyUrl case final value?) 'proxy_url': value,
      if (instance.height case final value?) 'height': value,
      if (instance.width case final value?) 'width': value,
    };
