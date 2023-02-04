// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// When received over the gateway, the buttons field is an array of strings,
/// which are the button labels. Bots cannot access a user's activity button
/// URLs.When sending, the buttons field must be an array of the below object:
class ActivityButtonListConverter
    extends JsonConverter<List<ActivityButton>?, dynamic> {
  /// Constructor
  const ActivityButtonListConverter();

  @override
  List<ActivityButton>? fromJson(dynamic json) {
    if (json == null) return null;
    json as List;
    return json.map((e) => ActivityButton(label: e)).toList();
  }

  @override
  List<Map<String, dynamic>>? toJson(List<ActivityButton>? object) {
    if (object == null) return null;
    return object.map((e) => e.toJson()).toList();
  }
}
