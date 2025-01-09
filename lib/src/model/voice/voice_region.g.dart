// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'voice_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceRegion _$VoiceRegionFromJson(Map<String, dynamic> json) => VoiceRegion(
      id: json['id'] as String,
      name: json['name'] as String,
      optimal: json['optimal'] as bool,
      deprecated: json['deprecated'] as bool,
      custom: json['custom'] as bool,
    );

Map<String, dynamic> _$VoiceRegionToJson(VoiceRegion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'optimal': instance.optimal,
      'deprecated': instance.deprecated,
      'custom': instance.custom,
    };
