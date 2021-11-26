// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedImage _$EmbedImageFromJson(Map<String, dynamic> json) => EmbedImage(
      url: json['url'] as String,
      proxyUrl: json['proxy_url'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$EmbedImageToJson(EmbedImage instance) {
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
