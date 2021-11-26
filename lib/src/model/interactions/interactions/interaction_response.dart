// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'interaction_response.g.dart';

/// Interaction Response structure
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-response-object-interaction-response-structure
@JsonSerializable(includeIfNull: false)
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

  /// Convenience method to create an [InteractionResponse] with message data
  InteractionResponse.withData({
    this.type = InteractionCallbackType.channelMessageWithSource,
    bool? tts,
    String? content,
    List<Embed>? embeds,
    AllowedMentions? allowedMentions,
    List<MessageFlag>? flags,
    List<Component>? components,
    List<Attachment>? attachments,
  }) : data = InteractionCallbackData(
          tts: tts,
          content: content,
          embeds: embeds,
          allowedMentions: allowedMentions,
          flags: flags,
          components: components,
          attachments: attachments,
        );

  /// From json
  factory InteractionResponse.fromJson(Map<String, dynamic> json) =>
      _$InteractionResponseFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InteractionResponseToJson(this);
}
