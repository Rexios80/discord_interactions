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
      rateLimitPerUser: json['rate_limit_per_user'] as int?,
    );

Map<String, dynamic> _$ThreadMetadataToJson(ThreadMetadata instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'auto_archive_duration':
          _$ThreadAutoArchiveDurationEnumMap[instance.autoArchiveDuration],
      'archive_timestamp': instance.archiveTimestamp?.toIso8601String(),
      'locked': instance.locked,
      'invitable': instance.invitable,
      'rate_limit_per_user': instance.rateLimitPerUser,
    };

const _$ThreadAutoArchiveDurationEnumMap = {
  ThreadAutoArchiveDuration.oneHour: 60,
  ThreadAutoArchiveDuration.oneDay: 1440,
  ThreadAutoArchiveDuration.threeDays: 4320,
  ThreadAutoArchiveDuration.sevenDays: 10080,
};
