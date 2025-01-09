// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'embed_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbedProvider _$EmbedProviderFromJson(Map<String, dynamic> json) =>
    EmbedProvider(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$EmbedProviderToJson(EmbedProvider instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.url case final value?) 'url': value,
    };
