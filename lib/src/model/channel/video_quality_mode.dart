import 'package:json_annotation/json_annotation.dart';

/// Video quality mode
enum VideoQualityMode {
  /// Discord chooses the quality for optimal performance
  @JsonValue(1)
  auto,

  /// 720p
  @JsonValue(2)
  full,
}
