import 'package:discord_interactions/discord_interactions.dart';
import 'package:json_annotation/json_annotation.dart';

/// Byte tranform int to InteracitonCallbackDataFlags
class InteractionCallbackDataFlagConverter
    extends JsonConverter<List<InteractionCallbackDataFlag>?, int?> {
  /// Constructor
  const InteractionCallbackDataFlagConverter();

  @override
  List<InteractionCallbackDataFlag>? fromJson(int? json) {
    if (json == null) return null;
    return InteractionCallbackDataFlag.values
        .where((flag) => (json & flag.value) == flag.value)
        .toList();
  }

  @override
  int? toJson(List<InteractionCallbackDataFlag>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value);
  }
}
