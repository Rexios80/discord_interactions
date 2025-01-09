// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'activity_timestamps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTimestamps _$ActivityTimestampsFromJson(Map<String, dynamic> json) =>
    ActivityTimestamps(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActivityTimestampsToJson(ActivityTimestamps instance) =>
    <String, dynamic>{
      if (instance.start case final value?) 'start': value,
      if (instance.end case final value?) 'end': value,
    };
