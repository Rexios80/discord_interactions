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

/// Extension on [VideoQualityMode]
extension VideoQualityModeExtension on VideoQualityMode {
  static const _enumMap = <VideoQualityMode, int>{
    VideoQualityMode.auto: 1,
    VideoQualityMode.full: 2,
  };

  /// Returns the integer value of the enum
  int get value => _enumMap[this]!;

  /// Returns the enum from the integer value
  static VideoQualityMode fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
