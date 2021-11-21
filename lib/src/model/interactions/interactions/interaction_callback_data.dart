// Package imports:
import 'package:discord_interactions/src/converter/flag/message_flag_converter.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'interaction_callback_data.g.dart';

/// Interaction Callback Data structure
///
/// Not all message fields are currently supported.
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding#interaction-response-object-interaction-callback-data-structure
@JsonSerializable()
class InteractionCallbackData {
  /// is the response TTS
  final bool? tts;

  /// message content
  final String? content;

  /// supports up to 10 embeds
  final List<Embed>? embeds;

  /// allowed mentions object
  @JsonKey(name: 'allowed_mentions')
  final AllowedMentions? allowedMentions;

  /// interaction callback data flags
  @MessageFlagConverter()
  final List<MessageFlag>? flags;

  /// message components
  final List<Component>? components;

  /// attachment objects with filename and description
  ///
  /// See Uploading Files for details.
  final List<Attachment>? attachments;

  /// Constructor
  InteractionCallbackData({
    this.tts,
    this.content,
    this.embeds,
    this.allowedMentions,
    this.flags,
    this.components,
    this.attachments,
  });

  /// From json
  factory InteractionCallbackData.fromJson(Map<String, dynamic> json) =>
      _$InteractionCallbackDataFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$InteractionCallbackDataToJson(this);
}
