// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Button Styles
enum ButtonStyle {
  /// Color: blurple
  ///
  /// Required field: custom_id
  @JsonValue(1)
  primary,

  /// Color: grey
  ///
  /// Required field: custom_id
  @JsonValue(2)
  secondary,

  /// Color: green
  ///
  /// Required field: custom_id
  @JsonValue(3)
  success,

  /// Color: red
  ///
  /// Required field: custom_id
  @JsonValue(4)
  danger,

  /// Color: grey, navigates to a URL
  ///
  /// Required field: url
  @JsonValue(5)
  link,
}
