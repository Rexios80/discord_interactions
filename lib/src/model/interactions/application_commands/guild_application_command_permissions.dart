// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'guild_application_command_permissions.g.dart';

/// Guild Application Command Permissions structure
///
/// Application command permissions allow you to enable or disable commands for
/// specific users or roles within a guild.
///
/// https://discord.com/developers/docs/interactions/application-commands#application-command-permissions-object-guild-application-command-permissions-structure
@JsonSerializable(includeIfNull: false)
class GuildApplicationCommandPermissions {
  /// the id of the command
  final String id;

  /// the id of the application the command belongs to
  @JsonKey(name: 'application_id')
  final String? appplicationId;

  /// the id of the guild
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the permissions for the command in the guild
  final List<ApplicationCommandPermissions> permissions;

  /// Constructor
  GuildApplicationCommandPermissions({
    required this.id,
    this.appplicationId,
    this.guildId,
    required this.permissions,
  });

  /// From json
  factory GuildApplicationCommandPermissions.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GuildApplicationCommandPermissionsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() =>
      _$GuildApplicationCommandPermissionsToJson(this);
}
