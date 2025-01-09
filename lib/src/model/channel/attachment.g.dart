// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String,
      filename: json['filename'] as String,
      description: json['description'] as String?,
      contentType: json['content_type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      url: json['url'] as String?,
      proxyUrl: json['proxy_url'] as String?,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      ephemeral: json['ephemeral'] as bool?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      if (instance.description case final value?) 'description': value,
      if (instance.contentType case final value?) 'content_type': value,
      if (instance.size case final value?) 'size': value,
      if (instance.url case final value?) 'url': value,
      if (instance.proxyUrl case final value?) 'proxy_url': value,
      if (instance.height case final value?) 'height': value,
      if (instance.width case final value?) 'width': value,
      if (instance.ephemeral case final value?) 'ephemeral': value,
    };
