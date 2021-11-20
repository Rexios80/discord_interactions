// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'interaction_response.g.dart';

/// Interaction Response structure
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-response-object-interaction-response-structure
@JsonSerializable()
class InteractionResponse {
  /// the type of response
  final InteractionCallbackType type;

  /// an optional response message
  final InteractionCallbackData? data;

  /// Constructor
  InteractionResponse({
    required this.type,
    this.data,
  });

  /// From json
  factory InteractionResponse.fromJson(Map<String, dynamic> json) =>
      _$InteractionResponseFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InteractionResponseToJson(this);
}
