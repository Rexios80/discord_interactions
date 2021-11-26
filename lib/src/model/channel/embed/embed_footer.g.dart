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

Map<String, dynamic> _$EmbedFooterToJson(EmbedFooter instance) {
  final val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon_url', instance.iconUrl);
  writeNotNull('proxy_icon_url', instance.proxyIconUrl);
  return val;
}
