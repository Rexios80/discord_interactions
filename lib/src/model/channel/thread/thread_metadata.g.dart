// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'thread_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadMetadata _$ThreadMetadataFromJson(Map<String, dynamic> json) =>
    ThreadMetadata(
      archived: json['archived'] as bool,
      autoArchiveDuration: $enumDecode(
          _$ThreadAutoArchiveDurationEnumMap, json['auto_archive_duration']),
      archiveTimestamp: DateTime.parse(json['archive_timestamp'] as String),
      locked: json['locked'] as bool,
      invitable: json['invitable'] as bool?,
    );

Map<String, dynamic> _$ThreadMetadataToJson(ThreadMetadata instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'auto_archive_duration':
          _$ThreadAutoArchiveDurationEnumMap[instance.autoArchiveDuration]!,
      'archive_timestamp': instance.archiveTimestamp.toIso8601String(),
      'locked': instance.locked,
      if (instance.invitable case final value?) 'invitable': value,
    };

const _$ThreadAutoArchiveDurationEnumMap = {
  ThreadAutoArchiveDuration.oneHour: 60,
  ThreadAutoArchiveDuration.oneDay: 1440,
  ThreadAutoArchiveDuration.threeDays: 4320,
  ThreadAutoArchiveDuration.oneWeek: 10080,
};
