import 'package:discord_interactions/src/model/interactions/application_commands/application_command_permissions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_application_command_permissions.g.dart';

/// Application command permissions allow you to enable or disable commands for specific users or roles within a guild.
@JsonSerializable()
class GuildApplicationCommandPermissions {
  /// the id of the command
  final String id;

  /// the id of the application the command belongs to
  @JsonKey(name: 'application_id')
  final String? appplicationId;

  /// the id of the guild
  @JsonKey(name: 'guild_id')
  final String guildId;

  /// the permissions for the command in the guild
  final List<ApplicationCommandPermissions> permissions;

  /// Create a new instance of [GuildApplicationCommandPermissions]
  GuildApplicationCommandPermissions({
    required this.id,
    this.appplicationId,
    required this.guildId,
    required this.permissions,
  });
}
