// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/message_flag_converter.dart';

part 'followup_message.g.dart';

/// Webhook form params
///
/// one of [content], [files], [embeds] must be set
/// 
/// https://discord.com/developers/docs/resources/webhook#execute-webhook-jsonform-params
@JsonSerializable()
class FollowupMessage {
  /// the message contents (up to 2000 characters)
  final String? content;

  /// true if this is a TTS message
  final bool? tts;

  /// array of up to 10 [Embed] objects
  final List<Embed>? embeds;

  /// allowed mentions for the message
  final AllowedMentions? allowedMentions;

  /// the components to include with the message
  final List<Component>? components;

  /// attachment objects with filename and description
  final List<Attachment>? attachments;

  /// interaction callback data flags
  @MessageFlagConverter()
  final List<MessageFlag>? flags;

  /// Constructor
  FollowupMessage({
    this.content,
    this.tts,
    this.embeds,
    this.allowedMentions,
    this.components,
    this.attachments,
    this.flags,
  });

  /// From json
  factory FollowupMessage.fromJson(Map<String, dynamic> json) =>
      _$FollowupMessageFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$FollowupMessageToJson(this);
}
