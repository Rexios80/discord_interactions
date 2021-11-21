// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Byte transform int to [ActivityFlag]
class ActivityFlagConverter extends JsonConverter<List<ActivityFlag>?, int?> {
  /// Constructor
  const ActivityFlagConverter();

  @override
  List<ActivityFlag>? fromJson(int? json) {
    if (json == null) return null;
    return ActivityFlag.values
        .where((flag) => (json & flag.value) == flag.value)
        .toList();
  }

  @override
  int? toJson(List<ActivityFlag>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value);
  }
}
