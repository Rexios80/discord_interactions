// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedThumbnail _$EmbedThumbnailFromJson(Map<String, dynamic> json) =>
    EmbedThumbnail(
      url: json['url'] as String,
      proxyUrl: json['proxy_url'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$EmbedThumbnailToJson(EmbedThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
      'proxy_url': instance.proxyUrl,
      'height': instance.height,
      'width': instance.width,
    };
