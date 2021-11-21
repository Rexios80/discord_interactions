// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Byte tranform int to [MessageFlag]
class MessageFlagConverter extends JsonConverter<List<MessageFlag>?, int?> {
  /// Constructor
  const MessageFlagConverter();

  @override
  List<MessageFlag>? fromJson(int? json) {
    if (json == null) return null;
    return MessageFlag.values
        .where((flag) => (json & flag.value) == flag.value)
        .toList();
  }

  @override
  int? toJson(List<MessageFlag>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value);
  }
}
