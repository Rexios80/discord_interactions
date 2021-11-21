// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/converter/date/unix_time_converter.dart';

part 'activity_timestamps.g.dart';

/// Activity Timestamps structure
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-timestamps
@JsonSerializable()
class ActivityTimestamps {
  /// unix time (in milliseconds) of when the activity started
  @UnixTimeConverterNullable()
  final int? start;

  /// unix time (in milliseconds) of when the activity ends
  @UnixTimeConverterNullable()
  final int? end;

  /// Constructor
  ActivityTimestamps({this.start, this.end});

  /// From json
  factory ActivityTimestamps.fromJson(Map<String, dynamic> json) =>
      _$ActivityTimestampsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ActivityTimestampsToJson(this);
}
