// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Byte tranform int to [UserFlag]
class UserFlagConverter extends JsonConverter<List<UserFlag>?, int?> {
  /// Constructor
  const UserFlagConverter();

  @override
  List<UserFlag>? fromJson(int? json) {
    if (json == null) return null;
    return UserFlag.values
        .where((flag) => (json & flag.value) == flag.value)
        .toList();
  }

  @override
  int? toJson(List<UserFlag>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value);
  }
}
