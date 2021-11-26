// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'integration_application.g.dart';

/// Integration Application structure
///
/// https://discord.com/developers/docs/resources/guild#integration-application-object-integration-application-structure
@JsonSerializable(includeIfNull: false)
class IntegrationApplication {
  /// the id of the app
  final String id;

  /// the name of the app
  final String name;

  /// the icon hash of the app
  final String? icon;

  /// the description of the app
  final String description;

  /// the summary of the app
  final String summary;

  /// the bot associated with this application
  final User? bot;

  /// Constructor
  IntegrationApplication({
    required this.id,
    required this.name,
    this.icon,
    required this.description,
    required this.summary,
    this.bot,
  });

  /// From json
  factory IntegrationApplication.fromJson(Map<String, dynamic> json) =>
      _$IntegrationApplicationFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$IntegrationApplicationToJson(this);
}
