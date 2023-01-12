// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$EmbedThumbnailToJson(EmbedThumbnail instance) {
  final val = <String, dynamic>{
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('proxy_url', instance.proxyUrl);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  return val;
}
