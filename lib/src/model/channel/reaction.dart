import 'package:discord_interactions/src/model/emoji/emoji.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reaction.g.dart';

/// Reaction structure
@JsonSerializable()
class Reaction {
  /// times this emoji has been used to react
  final int count;

  /// whether the current user reacted using this emoji
  final bool me;

  /// emoji information
  final Emoji emoji;

  /// Constructor
  Reaction({
    required this.count,
    required this.me,
    required this.emoji,
  });

  /// From json
  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ReactionToJson(this);
}
