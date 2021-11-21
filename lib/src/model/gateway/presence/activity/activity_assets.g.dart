// GENERATED CODE - DO NOT MODIFY BY HAND

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
      'large_image': instance.largeImage,
      'large_text': instance.largeText,
      'small_image': instance.smallImage,
      'small_text': instance.smallText,
    };
