// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'embed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Embed _$EmbedFromJson(Map<String, dynamic> json) => Embed(
      title: json['title'] as String?,
      type: $enumDecodeNullable(_$EmbedTypeEnumMap, json['type']),
      description: json['description'] as String?,
      url: json['url'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      color: (json['color'] as num?)?.toInt(),
      footer: json['footer'] == null
          ? null
          : EmbedFooter.fromJson(json['footer'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : EmbedImage.fromJson(json['image'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : EmbedThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : EmbedVideo.fromJson(json['video'] as Map<String, dynamic>),
      provider: json['provider'] == null
          ? null
          : EmbedProvider.fromJson(json['provider'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : EmbedAuthor.fromJson(json['author'] as Map<String, dynamic>),
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => EmbedField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmbedToJson(Embed instance) => <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (_$EmbedTypeEnumMap[instance.type] case final value?) 'type': value,
      if (instance.description case final value?) 'description': value,
      if (instance.url case final value?) 'url': value,
      if (instance.timestamp?.toIso8601String() case final value?)
        'timestamp': value,
      if (instance.color case final value?) 'color': value,
      if (instance.footer case final value?) 'footer': value,
      if (instance.image case final value?) 'image': value,
      if (instance.thumbnail case final value?) 'thumbnail': value,
      if (instance.video case final value?) 'video': value,
      if (instance.provider case final value?) 'provider': value,
      if (instance.author case final value?) 'author': value,
      if (instance.fields case final value?) 'fields': value,
    };

const _$EmbedTypeEnumMap = {
  EmbedType.rich: 'rich',
  EmbedType.image: 'image',
  EmbedType.video: 'video',
  EmbedType.gifv: 'gifv',
  EmbedType.article: 'article',
  EmbedType.link: 'link',
};
