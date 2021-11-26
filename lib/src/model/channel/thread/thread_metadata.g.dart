// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadMetadata _$ThreadMetadataFromJson(Map<String, dynamic> json) =>
    ThreadMetadata(
      archived: json['archived'] as bool?,
      autoArchiveDuration: $enumDecodeNullable(
          _$ThreadAutoArchiveDurationEnumMap, json['auto_archive_duration']),
      archiveTimestamp: json['archive_timestamp'] == null
          ? null
          : DateTime.parse(json['archive_timestamp'] as String),
      locked: json['locked'] as bool?,
      invitable: json['invitable'] as bool?,
    );

Map<String, dynamic> _$ThreadMetadataToJson(ThreadMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('archived', instance.archived);
  writeNotNull('auto_archive_duration',
      _$ThreadAutoArchiveDurationEnumMap[instance.autoArchiveDuration]);
  writeNotNull(
      'archive_timestamp', instance.archiveTimestamp?.toIso8601String());
  writeNotNull('locked', instance.locked);
  writeNotNull('invitable', instance.invitable);
  return val;
}

const _$ThreadAutoArchiveDurationEnumMap = {
  ThreadAutoArchiveDuration.oneHour: 60,
  ThreadAutoArchiveDuration.oneDay: 1440,
  ThreadAutoArchiveDuration.threeDays: 4320,
  ThreadAutoArchiveDuration.oneWeek: 10080,
};
