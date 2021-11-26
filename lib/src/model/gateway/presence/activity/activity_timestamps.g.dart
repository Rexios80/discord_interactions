// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_timestamps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTimestamps _$ActivityTimestampsFromJson(Map<String, dynamic> json) =>
    ActivityTimestamps(
      start: json['start'] as int?,
      end: json['end'] as int?,
    );

Map<String, dynamic> _$ActivityTimestampsToJson(ActivityTimestamps instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}
