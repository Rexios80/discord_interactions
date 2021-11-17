import 'package:json_annotation/json_annotation.dart';

/// The type of application command permission
enum ApplicationCommandPermissionType {
  /// role
  @JsonValue(1)
  role,

  /// user
  @JsonValue(2)
  user,
}
