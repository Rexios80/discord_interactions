// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$EmbedToJson(Embed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('type', _$EmbedTypeEnumMap[instance.type]);
  writeNotNull('description', instance.description);
  writeNotNull('url', instance.url);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('color', instance.color);
  writeNotNull('footer', instance.footer);
  writeNotNull('image', instance.image);
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('video', instance.video);
  writeNotNull('provider', instance.provider);
  writeNotNull('author', instance.author);
  writeNotNull('fields', instance.fields);
  return val;
}

const _$EmbedTypeEnumMap = {
  EmbedType.rich: 'rich',
  EmbedType.image: 'image',
  EmbedType.video: 'video',
  EmbedType.gifv: 'gifv',
  EmbedType.article: 'article',
  EmbedType.link: 'link',
};
