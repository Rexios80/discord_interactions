// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'application_command_permissions.g.dart';

/// Application command permissions allow you to enable or disable commands for specific users or roles within a guild.
@JsonSerializable()
class ApplicationCommandPermissions {
  /// the id of the role or user
  final String id;

  /// role or user
  final ApplicationCommandPermissionType type;

  /// true to allow, false, to disallow
  final bool permission;

  /// Creates a new instance of [ApplicationCommandPermissions].
  ApplicationCommandPermissions({
    required this.id,
    required this.type,
    required this.permission,
  });

  /// From json
  factory ApplicationCommandPermissions.fromJson(Map<String, dynamic> json) =>
      _$ApplicationCommandPermissionsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ApplicationCommandPermissionsToJson(this);
}