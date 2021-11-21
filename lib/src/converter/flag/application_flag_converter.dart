// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Byte transform int to [ApplicationFlag]
class ApplicationFlagConverter
    extends JsonConverter<List<ApplicationFlag>?, int?> {
  /// Constructor
  const ApplicationFlagConverter();

  @override
  List<ApplicationFlag>? fromJson(int? json) {
    if (json == null) return null;
    return ApplicationFlag.values
        .where((flag) => (json & flag.value) == flag.value)
        .toList();
  }

  @override
  int? toJson(List<ApplicationFlag>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value);
  }
}
