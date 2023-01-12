// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'embed_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedProvider _$EmbedProviderFromJson(Map<String, dynamic> json) =>
    EmbedProvider(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$EmbedProviderToJson(EmbedProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('url', instance.url);
  return val;
}
