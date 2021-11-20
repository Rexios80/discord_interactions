// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Application Command Permission types
///
/// https://discord.com/developers/docs/interactions/application-commands#application-command-permissions-object-application-command-permission-type
enum ApplicationCommandPermissionType {
  /// role
  @JsonValue(1)
  role,

  /// user
  @JsonValue(2)
  user,
}
