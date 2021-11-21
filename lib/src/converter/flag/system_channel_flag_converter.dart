// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Byte tranform int to [SystemChannelFlag]
class SystemChannelFlagConverter
    extends JsonConverter<List<SystemChannelFlag>?, int?> {
  /// Constructor
  const SystemChannelFlagConverter();

  @override
  List<SystemChannelFlag>? fromJson(int? json) {
    if (json == null) return null;
    return SystemChannelFlag.values
        .where((flag) => (json & flag.value) == flag.value)
        .toList();
  }

  @override
  int? toJson(List<SystemChannelFlag>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value);
  }
}
