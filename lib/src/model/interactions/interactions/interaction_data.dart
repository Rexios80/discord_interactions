// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'interaction_data.g.dart';

/// the command data payload
@JsonSerializable()
class InteractionData {
  /// the ID of the invoked command
  ///
  /// Interaction type: Application Command
  final String id;

  /// the name of the invoked command
  ///
  /// Interaction type: Application Command
  final String name;

  /// the type of the invoked command
  ///
  /// Interaction type: Application Command
  final ApplicationCommandType type;

  /// converted users + roles + channels
  ///
  /// Interaction type: Application Command
  final ResolvedData? resolved;

  /// the params + values from the user
  ///
  /// Interaction type: Application Command
  final List<ApplicationCommandInteractionDataOption>? options;

  /// the custom_id of the component
  ///
  /// Interaction type: Component
  @JsonKey(name: 'custom_id')
  final String? customId;

  /// the type of the component
  ///
  /// Interaction type: Component
  @JsonKey(name: 'component_type')
  final ComponentType? componentType;

  /// the values the user selected
  ///
  /// Interaction type: Component (Select)
  final List<SelectOption>? values;

  /// id the of user or message targetted by a user or message command
  ///
  /// User Command, Message Command
  @JsonKey(name: 'target_id')
  final String? targetId;

  /// Create a new InteractionData
  InteractionData({
    required this.id,
    required this.name,
    required this.type,
    this.resolved,
    this.options,
    this.customId,
    this.componentType,
    this.values,
    this.targetId,
  });

  /// From json
  factory InteractionData.fromJson(Map<String, dynamic> json) =>
      _$InteractionDataFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InteractionDataToJson(this);
}
