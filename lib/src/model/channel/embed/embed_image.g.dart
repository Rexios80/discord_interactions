// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'embed_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedImage _$EmbedImageFromJson(Map<String, dynamic> json) => EmbedImage(
      url: json['url'] as String,
      proxyUrl: json['proxy_url'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmbedImageToJson(EmbedImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      if (instance.proxyUrl case final value?) 'proxy_url': value,
      if (instance.height case final value?) 'height': value,
      if (instance.width case final value?) 'width': value,
    };
