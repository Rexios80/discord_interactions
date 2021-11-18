// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'message_reference.g.dart';

/// Message Reference structure
@JsonSerializable()
class MessageReference {
  /// id of the originating message
  @JsonKey(name: 'message_id')
  final String? messageId;

  /// id of the originating message's channel
  ///
  /// channel_id is optional when creating a reply, but will always be present
  /// when receiving an event/response that includes this data model.
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// id of the originating message's guild
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// when sending, whether to error if the referenced message doesn't exist
  /// instead of sending as a normal (non-reply) message, default true
  @JsonKey(name: 'fail_if_not_exists')
  final bool? failIfNotExists;

  /// Constructor
  MessageReference({
    this.messageId,
    this.channelId,
    this.guildId,
    this.failIfNotExists,
  });

  /// From json
  factory MessageReference.fromJson(Map<String, dynamic> json) =>
      _$MessageReferenceFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$MessageReferenceToJson(this);
}
