// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String?,
      filename: json['filename'] as String,
      description: json['description'] as String?,
      contentType: json['content_type'] as String?,
      size: json['size'] as int?,
      url: json['url'] as String?,
      proxyUrl: json['proxy_url'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      ephemeral: json['ephemeral'] as bool?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'description': instance.description,
      'content_type': instance.contentType,
      'size': instance.size,
      'url': instance.url,
      'proxy_url': instance.proxyUrl,
      'height': instance.height,
      'width': instance.width,
      'ephemeral': instance.ephemeral,
    };
