// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'welcome_screen.g.dart';

/// Welcome Screen structure
///
/// https://discord.com/developers/docs/resources/guild#welcome-screen-object-welcome-screen-structure
@JsonSerializable(includeIfNull: false)
class WelcomeScreen {
  /// the server description shown in the welcome screen
  final String? description;

  /// the channels shown in the welcome screen, up to 5
  @JsonKey(name: 'welcome_channels')
  final List<WelcomeScreenChannel> welcomeChannels;

  /// Constructor
  WelcomeScreen({
    this.description,
    required this.welcomeChannels,
  });

  /// From json
  factory WelcomeScreen.fromJson(Map<String, dynamic> json) =>
      _$WelcomeScreenFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$WelcomeScreenToJson(this);
}
