// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'message_activity.g.dart';

/// Message Activity structure
///
/// https://discord.com/developers/docs/resources/channel#message-object-message-activity-structure
@JsonSerializable()
class MessageActivity {
  /// type of message activity
  final MessageActivityType type;

  /// party_id from a Rich Presence event
  @JsonKey(name: 'party_id')
  final String? partyId;

  /// Constructor
  MessageActivity({
    required this.type,
    this.partyId,
  });

  /// From json
  factory MessageActivity.fromJson(Map<String, dynamic> json) =>
      _$MessageActivityFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$MessageActivityToJson(this);
}
