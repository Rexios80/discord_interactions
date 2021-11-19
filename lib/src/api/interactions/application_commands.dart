// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Application Commands API
class ApplicationCommands {
  static const _basePath = '/applications';

  final Dio _dio;
  final String _path;

  /// Constructor
  ApplicationCommands(
    this._dio, {
    required String applicationId,
  }) : _path = '$_basePath/$applicationId';

  /// Fetch all of the global commands for your application. Returns an array of [ApplicationCommand] objects.
  Future<DiscordResponse<List<ApplicationCommand>>>
      getGlobalApplicationCommands() {
    return validateApiCall(
      _dio.get('$_path/commands'),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Create a new global command. New global commands will be available in all guilds after 1 hour.
  /// Returns 201 and an [ApplicationCommand] object.
  ///
  /// Creating a command with the same name as an existing command for your application will overwrite the old command.
  Future<DiscordResponse<ApplicationCommand>> createGlobalApplicationCommand(
    ApplicationCommand command,
  ) {
    return validateApiCall(
      _dio.post('/$_path/commands', data: command),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Fetch a global command for your application. Returns an [ApplicationCommand] object.
  Future<DiscordResponse<ApplicationCommand>> getGlobalApplicationCommand(
    String commandId,
  ) {
    return validateApiCall(
      _dio.get('$_path/commands/$commandId'),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Edit a global command. Updates will be available in all guilds after 1 hour.
  /// Returns 200 and an [ApplicationCommand] object.
  Future<DiscordResponse<ApplicationCommand>> editGlobalApplicationCommand(
    ApplicationCommand command,
  ) {
    return validateApiCall(
      _dio.patch('$_path/commands/${command.id}', data: command),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Deletes a global command. Returns 204.
  Future<DiscordResponse> deleteGlobalApplicationCommand(String commandId) {
    return validateApiCall(_dio.delete('$_path/commands/$commandId'));
  }

  /// Takes a list of [ApplicationCommand]s, overwriting the existing global command list for this application.
  /// Updates will be available in all guilds after 1 hour. Returns 200 and a list of [ApplicationCommand] objects.
  /// Commands that do not already exist will count toward daily application command create limits.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  Future<DiscordResponse<List<ApplicationCommand>>>
      bulkOverwriteGlobalApplicationCommands(
    List<ApplicationCommand> commands,
  ) {
    return validateApiCall(
      _dio.put('$_path/commands', data: commands),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Fetch all of the guild commands for your application for a specific guild.
  /// Returns an array of [ApplicationCommand] objects.
  Future<DiscordResponse<List<ApplicationCommand>>>
      getGuildApplicationCommands({
    required String guildId,
  }) {
    return validateApiCall(
      _dio.get('$_path/guilds/$guildId/commands'),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Create a new guild command. New guild commands will be available in the guild immediately.
  /// Returns 201 and an [ApplicationCommand] object. If the command did not already exist,
  /// it will count toward daily application command create limits.
  ///
  /// Creating a command with the same name as an existing command for your application will overwrite the old command.
  Future<DiscordResponse<ApplicationCommand>> createGuildApplicationCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.post('$_path/guilds/$guildId/commands', data: command),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Fetch a guild command for your application. Returns an [ApplicationCommand] object.
  Future<DiscordResponse<ApplicationCommand>> getGuildApplicationCommand(
    String commandId, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.get('$_path/guilds/$guildId/commands/$commandId'),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Edit a guild command. Updates for guild commands will be available immediately.
  /// Returns 200 and an [ApplicationCommand] object.
  Future<DiscordResponse<ApplicationCommand>> editGuildApplicationCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_path/guilds/$guildId/commands/${command.id}',
        data: command,
      ),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Delete a guild command. Returns 204 on success.
  Future<DiscordResponse> deleteGuildApplicationCommand(
    String commandId, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.delete('$_path/guilds/$guildId/commands/$commandId'),
    );
  }

  /// Takes a list of application commands, overwriting the existing command list for this
  /// application for the targeted guild. Returns 200 and a list of [ApplicationCommand] objects.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  Future<DiscordResponse<List<ApplicationCommand>>>
      bulkOverwriteGuildApplicationCommands(
    List<ApplicationCommand> commands, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.put('$_path/guilds/$guildId/commands', data: commands),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Fetches command permissions for all commands for your application in a guild.
  /// Returns an array of [GuildApplicationCommandPermissions] objects.
  Future<DiscordResponse<List<GuildApplicationCommandPermissions>>>
      getGuildApplicationCommandPermissions({
    required String guildId,
  }) {
    return validateApiCall(
      _dio.get('$_path/guilds/$guildId/commands/permissions'),
      responseTransformer: (data) => (data as List)
          .map((e) => GuildApplicationCommandPermissions.fromJson(e))
          .toList(),
    );
  }

  /// Fetches command permissions for a specific command for your application in a guild.
  /// Returns a [GuildApplicationCommandPermissions] object.
  Future<DiscordResponse<GuildApplicationCommandPermissions>>
      getApplicationCommandPermissions(
    String commandId, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.get('$_path/guilds/$guildId/commands/$commandId/permissions'),
      responseTransformer: (data) =>
          GuildApplicationCommandPermissions.fromJson(data),
    );
  }

  /// Edits command permissions for a specific command for your application in a guild.
  /// You can only add up to 10 permission overwrites for a command.
  /// Returns a [GuildApplicationCommandPermissions] object.
  ///
  /// This endpoint will overwrite existing permissions for the command in that guild
  ///
  /// Deleting or renaming a command will permanently delete all permissions for that command
  Future<DiscordResponse<GuildApplicationCommandPermissions>>
      editApplicationCommandPermissions(
    String commandId, {
    required String guildId,
    required List<ApplicationCommandPermissions> permissions,
  }) {
    return validateApiCall(
      _dio.put(
        '$_path/guilds/$guildId/commands/$commandId/permissions',
        data: {'permissions': permissions},
      ),
      responseTransformer: (data) =>
          GuildApplicationCommandPermissions.fromJson(data),
    );
  }

  /// Batch edits permissions for all commands in a guild.
  /// Takes an array of partial guild application command permissions objects including id and permissions.
  /// You can only add up to 10 permission overwrites for a command.
  /// Returns an array of GuildApplicationCommandPermissions objects.
  ///
  /// This endpoint will overwrite all existing permissions for all commands in
  /// a guild,including slash commands, user commands, and message commands.
  Future<DiscordResponse<List<GuildApplicationCommandPermissions>>>
      batchEditApplicationCommandPermissions(
    List<GuildApplicationCommandPermissions> permissions, {
    required String guildId,
  }) {
    return validateApiCall(
      _dio.put(
        '$_path/guilds/$guildId/commands/permissions',
        data: permissions,
      ),
      responseTransformer: (data) => (data as List)
          .map((e) => GuildApplicationCommandPermissions.fromJson(e))
          .toList(),
    );
  }
}
