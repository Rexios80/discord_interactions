import 'package:dio/dio.dart';
import 'package:discord_interactions/src/model/interactions/application_commands/application_command.dart';
import 'package:discord_interactions/src/model/interactions/application_commands/guild_application_command_permissions.dart';

/// Access to the Application Commands API
class ApplicationCommands {
  static const _basePath = '/applications';

  final Dio _dio;
  final String _path;

  /// Creates a new instance of [ApplicationCommands]
  ApplicationCommands(
    this._dio, {
    required String applicationId,
  }) : _path = '$_basePath/$applicationId';

  /// Fetch all of the global commands for your application. Returns an array of [ApplicationCommand] objects.
  Future<List<ApplicationCommand>> getGlobalApplicationCommands() async {
    final response = await _dio.get('$_path/commands');
    return (response.data as List)
        .map((e) => ApplicationCommand.fromJson(e))
        .toList();
  }

  /// Create a new global command. New global commands will be available in all guilds after 1 hour.
  /// Returns 201 and an [ApplicationCommand] object.
  ///
  /// Creating a command with the same name as an existing command for your application will overwrite the old command.
  Future<ApplicationCommand> createGlobalApplicationCommand(
    ApplicationCommand command,
  ) async {
    final response = await _dio.post('/$_path/commands', data: command);
    return ApplicationCommand.fromJson(response.data);
  }

  /// Fetch a global command for your application. Returns an [ApplicationCommand] object.
  Future<Response<ApplicationCommand>> getGlobalApplicationCommand(
    String commandId,
  ) {
    return _dio.get('$_path/commands/$commandId');
  }

  /// Edit a global command. Updates will be available in all guilds after 1 hour.
  /// Returns 200 and an [ApplicationCommand] object.
  Future<Response<ApplicationCommand>> editGlobalApplicationCommand(
    ApplicationCommand command,
  ) {
    return _dio.patch('/$_path/commands/${command.id}', data: command);
  }

  /// Deletes a global command. Returns 204.
  Future<Response> deleteGlobalApplicationCommand(String commandId) {
    return _dio.delete('/$_path/commands/$commandId');
  }

  /// Takes a list of [ApplicationCommand]s, overwriting the existing global command list for this application.
  /// Updates will be available in all guilds after 1 hour. Returns 200 and a list of [ApplicationCommand] objects.
  /// Commands that do not already exist will count toward daily application command create limits.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  Future<List<ApplicationCommand>> bulkOverwriteGlobalApplicationCommands(
    List<ApplicationCommand> commands,
  ) async {
    final response = await _dio.put('$_path/commands', data: commands);
    return (response.data as List)
        .map((e) => ApplicationCommand.fromJson(e))
        .toList();
  }

  /// Fetch all of the guild commands for your application for a specific guild.
  /// Returns an array of [ApplicationCommand] objects.
  Future<Response<List<ApplicationCommand>>> getGuildApplicationCommands(
    String guildId,
  ) {
    return _dio.get('$_path/guilds/$guildId/commands');
  }

  /// Create a new guild command. New guild commands will be available in the guild immediately.
  /// Returns 201 and an [ApplicationCommand] object. If the command did not already exist,
  /// it will count toward daily application command create limits.
  ///
  /// Creating a command with the same name as an existing command for your application will overwrite the old command.
  Future<Response<ApplicationCommand>> createGuildApplicationCommand(
    String guildId, {
    required ApplicationCommand command,
  }) {
    return _dio.post('/$_path/guilds/$guildId/commands', data: command);
  }

  /// Fetch a guild command for your application. Returns an [ApplicationCommand] object.
  Future<Response<ApplicationCommand>> getGuildApplicationCommand(
    String guildId, {
    required String commandId,
  }) {
    return _dio.get('$_path/guilds/$guildId/commands/$commandId');
  }

  /// Edit a guild command. Updates for guild commands will be available immediately.
  /// Returns 200 and an [ApplicationCommand] object.
  Future<Response<ApplicationCommand>> editGuildApplicationCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return _dio.patch(
      '/$_path/guilds/$guildId/commands/${command.id}',
      data: command,
    );
  }

  /// Delete a guild command. Returns 204 on success.
  Future<Response> deleteGuildApplicationCommand(
    String commandId, {
    required String guildId,
  }) {
    return _dio.delete('/$_path/guilds/$guildId/commands/$commandId');
  }

  /// Takes a list of application commands, overwriting the existing command list for this
  /// application for the targeted guild. Returns 200 and a list of [ApplicationCommand] objects.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  Future<Response<List<ApplicationCommand>>>
      bulkOverwriteGuildApplicationCommands(
    List<ApplicationCommand> commands, {
    required String guildId,
  }) {
    return _dio.put(
      '/$_path/guilds/$guildId/commands',
      data: commands,
    );
  }

  /// Fetches command permissions for all commands for your application in a guild.
  /// Returns an array of [GuildApplicationCommandPermissions] objects.
  Future<Response<List<GuildApplicationCommandPermissions>>>
      getGuildApplicationCommandPermissions(String guildId) {
    return _dio.get('$_path/guilds/$guildId/commands/permissions');
  }

  /// Fetches command permissions for a specific command for your application in a guild.
  /// Returns a [GuildApplicationCommandPermissions] object.
  Future<Response<GuildApplicationCommandPermissions>>
      getApplicationCommandPermissions({
    required String commandId,
    required String guildId,
  }) {
    return _dio.get(
      '/$_path/guilds/$guildId/commands/$commandId/permissions',
    );
  }

  /// Edits command permissions for a specific command for your application in a guild.
  /// You can only add up to 10 permission overwrites for a command.
  /// Returns a [GuildApplicationCommandPermissions] object.
  ///
  /// This endpoint will overwrite existing permissions for the command in that guild
  ///
  /// Deleting or renaming a command will permanently delete all permissions for that command
  Future<Response<GuildApplicationCommandPermissions>>
      editApplicationCommandPermissions({
    required String commandId,
    required List<GuildApplicationCommandPermissions> permissions,
    required String guildId,
  }) {
    return _dio.put(
      '/$_path/guilds/$guildId/commands/$commandId/permissions',
      data: permissions,
    );
  }

  /// Batch edits permissions for all commands in a guild.
  /// Takes an array of partial guild application command permissions objects including id and permissions.
  /// You can only add up to 10 permission overwrites for a command.
  /// Returns an array of GuildApplicationCommandPermissions objects.
  ///
  /// This endpoint will overwrite all existing permissions for all commands in
  /// a guild,including slash commands, user commands, and message commands.
  Future<Response<List<GuildApplicationCommandPermissions>>>
      batchEditApplicationCommandPermissions({
    required String guildId,
    required List<GuildApplicationCommandPermissions> permissions,
  }) {
    return _dio.put(
      '/$_path/guilds/$guildId/commands/permissions',
      data: permissions,
    );
  }
}
