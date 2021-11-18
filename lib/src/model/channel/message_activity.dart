import 'package:discord_interactions/src/model/channel/message_activity_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_activity.g.dart';

/// Message Activity structure
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
