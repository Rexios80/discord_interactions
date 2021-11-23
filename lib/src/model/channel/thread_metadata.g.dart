// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadMetadata _$ThreadMetadataFromJson(Map<String, dynamic> json) =>
    ThreadMetadata(
      archived: json['archived'] as bool?,
      autoArchiveDuration: json['auto_archive_duration'] as int?,
      archiveTimestamp: json['archive_timestamp'] == null
          ? null
          : DateTime.parse(json['archive_timestamp'] as String),
      locked: json['locked'] as bool?,
      invitable: json['invitable'] as bool?,
    );

Map<String, dynamic> _$ThreadMetadataToJson(ThreadMetadata instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'auto_archive_duration': instance.autoArchiveDuration,
      'archive_timestamp': instance.archiveTimestamp?.toIso8601String(),
      'locked': instance.locked,
      'invitable': instance.invitable,
    };
