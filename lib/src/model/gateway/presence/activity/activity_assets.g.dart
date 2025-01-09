// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'activity_assets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityAssets _$ActivityAssetsFromJson(Map<String, dynamic> json) =>
    ActivityAssets(
      largeImage: json['large_image'] as String?,
      largeText: json['large_text'] as String?,
      smallImage: json['small_image'] as String?,
      smallText: json['small_text'] as String?,
    );

Map<String, dynamic> _$ActivityAssetsToJson(ActivityAssets instance) =>
    <String, dynamic>{
      if (instance.largeImage case final value?) 'large_image': value,
      if (instance.largeText case final value?) 'large_text': value,
      if (instance.smallImage case final value?) 'small_image': value,
      if (instance.smallText case final value?) 'small_text': value,
    };
