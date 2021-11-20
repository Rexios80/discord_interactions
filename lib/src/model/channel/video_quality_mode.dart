// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Video quality modes
/// 
/// https://discord.com/developers/docs/resources/channel#channel-object-video-quality-modes
enum VideoQualityMode {
  /// Discord chooses the quality for optimal performance
  @JsonValue(1)
  auto,

  /// 720p
  @JsonValue(2)
  full,
}
