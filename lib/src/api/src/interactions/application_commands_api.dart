// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Application Commands API
///
/// https://discord.com/developers/docs/interactions/application-commands
class ApplicationCommandsApi {
  final String _basePath;
  final Dio _dio;

  /// Constructor
  ApplicationCommandsApi(
    this._dio, {
    required String applicationId,
  }) : _basePath = '/applications/$applicationId';

  /// Fetch all of the global commands for your application. Returns an array
  /// of [ApplicationCommand] objects.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-global-application-commands
  Future<DiscordResponse<List<ApplicationCommand>>>
      getGlobalApplicationCommands() {
    return validateApiCall(
      _dio.get('$_basePath/commands'),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Create a new global command. New global commands will be available in all
  /// guilds after 1 hour. Returns 201 and an [ApplicationCommand] object.
  ///
  /// Creating a command with the same name as an existing command for your
  /// application will overwrite the old command.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#create-global-application-command
  Future<DiscordResponse<ApplicationCommand>> createGlobalApplicationCommand({
    /// 1-32 character name
    required String name,

    /// 1-100 character description
    String? description,

    /// the parameters for the command
    List<ApplicationCommandOption>? options,

    /// whether the command is enabled by default when the app is added to a
    /// guild
    ///
    /// Default: true
    bool? defaultPermission,

    /// the type of command, defaults 1 if not set
    ApplicationCommandType? type,
  }) {
    return validateApiCall(
      _dio.post(
        '/$_basePath/commands',
        data: {
          'name': name,
          if (description != null) 'description': description,
          if (options != null) 'options': options,
          if (defaultPermission != null)
            'default_permission': defaultPermission,
          if (type != null) 'type': type.value,
        },
      ),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Fetch a global command for your application. Returns an
  /// [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-global-application-command
  Future<DiscordResponse<ApplicationCommand>> getGlobalApplicationCommand(
    String commandId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/commands/$commandId'),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Edit a global command. Updates will be available in all guilds after 1 hour.
  /// Returns 200 and an [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#edit-global-application-command
  Future<DiscordResponse<ApplicationCommand>> editGlobalApplicationCommand(
    String commandId, {

    /// 1-32 character name
    String? name,

    /// 1-100 character description
    String? description,

    /// the parameters for the command
    List<ApplicationCommandOption>? options,

    /// whether the command is enabled by default when the app is added to a
    /// guild
    ///
    /// Default: true
    bool? defaultPermission,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/commands/$commandId',
        data: {
          if (name != null) 'name': name,
          if (description != null) 'description': description,
          if (options != null) 'options': options,
          if (defaultPermission != null)
            'default_permission': defaultPermission,
        },
      ),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Deletes a global command. Returns 204.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#delete-global-application-command
  Future<DiscordResponse<void>> deleteGlobalApplicationCommand(
    String commandId,
  ) {
    return validateApiCall(_dio.delete('$_basePath/commands/$commandId'));
  }

  /// Takes a list of [ApplicationCommand]s, overwriting the existing global command list for this application.
  /// Updates will be available in all guilds after 1 hour. Returns 200 and a list of [ApplicationCommand] objects.
  /// Commands that do not already exist will count toward daily application command create limits.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#bulk-overwrite-global-application-commands
  Future<DiscordResponse<List<ApplicationCommand>>>
      bulkOverwriteGlobalApplicationCommands(
    List<ApplicationCommand> commands,
  ) {
    return validateApiCall(
      _dio.put('$_basePath/commands', data: commands),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Fetch all of the guild commands for your application for a specific guild.
  /// Returns an array of [ApplicationCommand] objects.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-guild-application-commands
  Future<DiscordResponse<List<ApplicationCommand>>> getGuildApplicationCommands(
    String guildId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/guilds/$guildId/commands'),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Create a new guild command. New guild commands will be available in the guild immediately.
  /// Returns 201 and an [ApplicationCommand] object. If the command did not already exist,
  /// it will count toward daily application command create limits.
  ///
  /// Creating a command with the same name as an existing command for your application will overwrite the old command.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#create-guild-application-command
  Future<DiscordResponse<ApplicationCommand>> createGuildApplicationCommand(
    String guildId, {

    /// 1-32 character name
    required String name,

    /// 1-100 character description
    String? description,

    /// the parameters for the command
    List<ApplicationCommandOption>? options,

    /// whether the command is enabled by default when the app is added to a
    /// guild
    ///
    /// Default: true
    bool? defaultPermission,

    /// the type of command, defaults 1 if not set
    ApplicationCommandType? type,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/guilds/$guildId/commands',
        data: {
          'name': name,
          if (description != null) 'description': description,
          if (options != null) 'options': options,
          if (defaultPermission != null)
            'default_permission': defaultPermission,
          if (type != null) 'type': type.value,
        },
      ),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Fetch a guild command for your application. Returns an [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-guild-application-command
  Future<DiscordResponse<ApplicationCommand>> getGuildApplicationCommand(
    String guildId, {
    required String commandId,
  }) {
    return validateApiCall(
      _dio.get('$_basePath/guilds/$guildId/commands/$commandId'),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Edit a guild command. Updates for guild commands will be available immediately.
  /// Returns 200 and an [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#edit-guild-application-command
  Future<DiscordResponse<ApplicationCommand>> editGuildApplicationCommand(
    String guildId, {
    required String commandId,

    /// 1-32 character name
    String? name,

    /// 1-100 character description
    String? description,

    /// the parameters for the command
    List<ApplicationCommandOption>? options,

    /// whether the command is enabled by default when the app is added to a
    /// guild
    ///
    /// Default: true
    bool? defaultPermission,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/guilds/$guildId/commands/$commandId',
        data: {
          if (name != null) 'name': name,
          if (description != null) 'description': description,
          if (options != null) 'options': options,
          if (defaultPermission != null)
            'default_permission': defaultPermission,
        },
      ),
      responseTransformer: (data) => ApplicationCommand.fromJson(data),
    );
  }

  /// Delete a guild command. Returns 204 on success.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#delete-guild-application-command
  Future<DiscordResponse<void>> deleteGuildApplicationCommand(
    String guildId, {
    required String commandId,
  }) {
    return validateApiCall(
      _dio.delete('$_basePath/guilds/$guildId/commands/$commandId'),
    );
  }

  /// Takes a list of application commands, overwriting the existing command list for this
  /// application for the targeted guild. Returns 200 and a list of [ApplicationCommand] objects.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#bulk-overwrite-guild-application-commands
  Future<DiscordResponse<List<ApplicationCommand>>>
      bulkOverwriteGuildApplicationCommands(
    String guildId, {
    required List<ApplicationCommand> commands,
  }) {
    return validateApiCall(
      _dio.put('$_basePath/guilds/$guildId/commands', data: commands),
      responseTransformer: (data) =>
          (data as List).map((e) => ApplicationCommand.fromJson(e)).toList(),
    );
  }

  /// Fetches command permissions for all commands for your application in a guild.
  /// Returns an array of [GuildApplicationCommandPermissions] objects.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-guild-application-command-permissions
  Future<DiscordResponse<List<GuildApplicationCommandPermissions>>>
      getGuildApplicationCommandPermissions(String guildId) {
    return validateApiCall(
      _dio.get('$_basePath/guilds/$guildId/commands/permissions'),
      responseTransformer: (data) => (data as List)
          .map((e) => GuildApplicationCommandPermissions.fromJson(e))
          .toList(),
    );
  }

  /// Fetches command permissions for a specific command for your application in a guild.
  /// Returns a [GuildApplicationCommandPermissions] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-application-command-permissions
  Future<DiscordResponse<GuildApplicationCommandPermissions>>
      getApplicationCommandPermissions(
    String guildId, {
    required String commandId,
  }) {
    return validateApiCall(
      _dio.get('$_basePath/guilds/$guildId/commands/$commandId/permissions'),
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
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#edit-application-command-permissions
  Future<DiscordResponse<GuildApplicationCommandPermissions>>
      editApplicationCommandPermissions(
    String guildId, {
    required String commandId,
    required List<ApplicationCommandPermissions> permissions,
  }) {
    return validateApiCall(
      _dio.put(
        '$_basePath/guilds/$guildId/commands/$commandId/permissions',
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
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#batch-edit-application-command-permissions
  Future<DiscordResponse<List<GuildApplicationCommandPermissions>>>
      batchEditApplicationCommandPermissions(
    String guildId, {
    required List<GuildApplicationCommandPermissions> permissions,
  }) {
    return validateApiCall(
      _dio.put(
        '$_basePath/guilds/$guildId/commands/permissions',
        data: permissions,
      ),
      responseTransformer: (data) => (data as List)
          .map((e) => GuildApplicationCommandPermissions.fromJson(e))
          .toList(),
    );
  }
}
