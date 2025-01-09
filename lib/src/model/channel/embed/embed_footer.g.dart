// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      if (instance.iconUrl case final value?) 'icon_url': value,
      if (instance.proxyIconUrl case final value?) 'proxy_icon_url': value,
    };
