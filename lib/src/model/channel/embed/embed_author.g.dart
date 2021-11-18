// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedAuthor _$EmbedAuthorFromJson(Map<String, dynamic> json) => EmbedAuthor(
      name: json['name'] as String,
      url: json['url'] as String?,
      iconUrl: json['icon_url'] as String?,
      proxyIconUrl: json['proxy_icon_url'] as String?,
    );

Map<String, dynamic> _$EmbedAuthorToJson(EmbedAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'icon_url': instance.iconUrl,
      'proxy_icon_url': instance.proxyIconUrl,
    };
