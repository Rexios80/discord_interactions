// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Activity types
///
/// The streaming type currently only supports Twitch and YouTube. Only
/// https://twitch.tv/ and https://youtube.com/ urls will work.
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-types
enum ActivityType {
  /// Format: Playing {name}
  ///
  /// Example: "Playing Rocket League"
  @JsonValue(0)
  game,

  /// Format: Streaming {name}
  ///
  /// Example: "Streaming Rocket League"
  @JsonValue(1)
  streaming,

  /// Format: Listening to {name}
  ///
  /// Example: "Listening to Spotify"
  @JsonValue(2)
  listening,

  /// Format: Watching {name}
  ///
  /// Example: "Watching YouTube Together"
  @JsonValue(3)
  watching,

  /// Format: {emoji} {name}
  ///
  /// Example: ":smiley: I am cool"
  @JsonValue(4)
  custom,

  /// Format: Competing in {name}
  ///
  /// Example: "Competing in Arena World Champions"
  @JsonValue(5)
  competing,
}
