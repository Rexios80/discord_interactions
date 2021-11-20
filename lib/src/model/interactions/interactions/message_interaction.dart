// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'message_interaction.g.dart';

/// Message Interaction structure
/// 
/// This is sent on the message object when the message is a response to an
/// Interaction without an existing message.
///
/// This means responses to Message Components do not include this property,
/// instead including a message reference object as components always exist on
/// preexisting messages.
/// 
/// https://discord.com/developers/docs/interactions/receiving-and-responding#message-interaction-object-message-interaction-structure
@JsonSerializable()
class MessageInteraction {
  /// the id of the interaction
  final String id;

  /// the type of interaction
  final InteractionType type;

  /// the name of the application command
  final String command;

  /// the user who invoked the interaction
  final User user;

  /// Constructor
  MessageInteraction({
    required this.id,
    required this.type,
    required this.command,
    required this.user,
  });

  /// From json
  factory MessageInteraction.fromJson(Map<String, dynamic> json) =>
      _$MessageInteractionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$MessageInteractionToJson(this);
}
