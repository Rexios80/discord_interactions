// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'activity_secrets.g.dart';

/// Activity Secrets structure
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-secrets
@JsonSerializable()
class ActivitySecrets {
  /// the secret for joining a party
  final String? join;

  /// the secret for spectating a game
  final String? spectate;

  /// the secret for a specific instanced match
  final String? match;

  /// Constructor
  ActivitySecrets({
    this.join,
    this.spectate,
    this.match,
  });

  /// From json
  factory ActivitySecrets.fromJson(Map<String, dynamic> json) =>
      _$ActivitySecretsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ActivitySecretsToJson(this);
}
