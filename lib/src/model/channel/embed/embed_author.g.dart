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

Map<String, dynamic> _$EmbedAuthorToJson(EmbedAuthor instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('icon_url', instance.iconUrl);
  writeNotNull('proxy_icon_url', instance.proxyIconUrl);
  return val;
}
