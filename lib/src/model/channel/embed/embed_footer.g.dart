// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed_footer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedFooter _$EmbedFooterFromJson(Map<String, dynamic> json) => EmbedFooter(
      text: json['text'] as String,
      iconUrl: json['icon_url'] as String?,
      proxyIconUrl: json['proxy_icon_url'] as String?,
    );

Map<String, dynamic> _$EmbedFooterToJson(EmbedFooter instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon_url': instance.iconUrl,
      'proxy_icon_url': instance.proxyIconUrl,
    };
