// GENERATED CODE - DO NOT MODIFY BY HAND

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
      color: json['color'] as int?,
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
      'title': instance.title,
      'type': _$EmbedTypeEnumMap[instance.type],
      'description': instance.description,
      'url': instance.url,
      'timestamp': instance.timestamp?.toIso8601String(),
      'color': instance.color,
      'footer': instance.footer,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'video': instance.video,
      'provider': instance.provider,
      'author': instance.author,
      'fields': instance.fields,
    };

const _$EmbedTypeEnumMap = {
  EmbedType.rich: 'rich',
  EmbedType.image: 'image',
  EmbedType.video: 'video',
  EmbedType.gifv: 'gifv',
  EmbedType.article: 'article',
  EmbedType.link: 'link',
};
