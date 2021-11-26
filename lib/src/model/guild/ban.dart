// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'ban.g.dart';

/// Ban structure
///
/// https://discord.com/developers/docs/resources/guild#ban-object-ban-structure
@JsonSerializable(includeIfNull: false)
class Ban {
  /// the reason for the ban
  final String? reason;

  /// the banned user
  final User user;

  /// Constructor
  Ban({
    this.reason,
    required this.user,
  });

  /// From json
  factory Ban.fromJson(Map<String, dynamic> json) => _$BanFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$BanToJson(this);
}
