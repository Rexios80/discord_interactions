// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/converter/iso8601_converter.dart';

part 'thread_metadata.g.dart';

/// The thread metadata object contains a number of thread-specific channel
/// fields that are not needed by other channel types.
@JsonSerializable()
class ThreadMetadata {
  /// whether the thread is archived
  final bool archived;

  /// duration in minutes to automatically archive the thread after recent
  /// activity, can be set to: 60, 1440, 4320, 10080
  @JsonKey(name: 'auto_archive_duration')
  final int autoArchiveDuration;

  /// timestamp when the thread's archive status was last changed, used for
  /// calculating recent activity
  @ISO8601Converter()
  @JsonKey(name: 'archive_timestamp')
  final DateTime archiveTimestamp;

  /// whether the thread is locked; when a thread is locked, only users with
  /// MANAGE_THREADS can unarchive it
  final bool locked;

  /// whether non-moderators can add other non-moderators to a thread; only
  /// available on private threads
  final bool? invitable;

  /// Constructor
  ThreadMetadata({
    required this.archived,
    required this.autoArchiveDuration,
    required this.archiveTimestamp,
    required this.locked,
    this.invitable,
  });

  /// From json
  factory ThreadMetadata.fromJson(Map<String, dynamic> json) =>
      _$ThreadMetadataFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ThreadMetadataToJson(this);
}