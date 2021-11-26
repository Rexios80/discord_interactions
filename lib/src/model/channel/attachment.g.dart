// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String,
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

Map<String, dynamic> _$AttachmentToJson(Attachment instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'filename': instance.filename,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('content_type', instance.contentType);
  writeNotNull('size', instance.size);
  writeNotNull('url', instance.url);
  writeNotNull('proxy_url', instance.proxyUrl);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  writeNotNull('ephemeral', instance.ephemeral);
  return val;
}
