// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Thread Auto Archive druations
enum ThreadAutoArchiveDuration {
  /// 60 minutes
  @JsonValue(60)
  oneHour,

  /// 1440 minutes
  @JsonValue(1440)
  oneDay,

  /// 4320 minutes
  @JsonValue(4320)
  threeDays,

  /// 10080 minutes
  @JsonValue(10080)
  sevenDays,
}

/// Extension on [ThreadAutoArchiveDuration]
extension ThreadAutoArchiveDurationExtension on ThreadAutoArchiveDuration {
  static const _enumMap = <ThreadAutoArchiveDuration, int>{
    ThreadAutoArchiveDuration.oneHour: 60,
    ThreadAutoArchiveDuration.oneDay: 1440,
    ThreadAutoArchiveDuration.threeDays: 4320,
    ThreadAutoArchiveDuration.sevenDays: 10080,
  };

  /// Get the int value of the duration
  int get value => _enumMap[this]!;

  /// Create a [ThreadAutoArchiveDuration] from an int value
  static ThreadAutoArchiveDuration fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
