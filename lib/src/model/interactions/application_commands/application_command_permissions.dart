// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'application_command_permissions.g.dart';

/// Application Command Permissions structure
/// 
/// https://discord.com/developers/docs/interactions/application-commands#application-command-permissions-object-guild-application-command-permissions-structure
@JsonSerializable()
class ApplicationCommandPermissions {
  /// the id of the role or user
  final String id;

  /// role or user
  final ApplicationCommandPermissionType type;

  /// true to allow, false, to disallow
  final bool permission;

  /// Constructor
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
