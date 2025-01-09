// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      if (instance.url case final value?) 'url': value,
      if (instance.iconUrl case final value?) 'icon_url': value,
      if (instance.proxyIconUrl case final value?) 'proxy_icon_url': value,
    };
