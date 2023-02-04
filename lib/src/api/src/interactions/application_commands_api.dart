// Package imports:
import 'package:dio/dio.dart';
import 'package:dio_response_validator/dio_response_validator.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

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
  Future<ValidatedResponse<List, List<ApplicationCommand>>>
      getGlobalApplicationCommands() {
    return _dio.get<List>('$_basePath/commands').validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(ApplicationCommand.fromJson)
              .toList(),
        );
  }

  /// Create a new global command. New global commands will be available in all
  /// guilds after 1 hour. Returns 201 and an [ApplicationCommand] object.
  ///
  /// Creating a command with the same name as an existing command for your
  /// application will overwrite the old command.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#create-global-application-command
  Future<ValidatedResponse<Map<String, dynamic>, ApplicationCommand>>
      createGlobalApplicationCommand({
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
    return _dio.post<Map<String, dynamic>>(
      '/$_basePath/commands',
      data: {
        'name': name,
        if (description != null) 'description': description,
        if (options != null) 'options': options,
        if (defaultPermission != null) 'default_permission': defaultPermission,
        if (type != null) 'type': type.value,
      },
    ).validate(transform: ApplicationCommand.fromJson);
  }

  /// Fetch a global command for your application. Returns an
  /// [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-global-application-command
  Future<ValidatedResponse<Map<String, dynamic>, ApplicationCommand>>
      getGlobalApplicationCommand(
    String commandId,
  ) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/commands/$commandId')
        .validate(transform: ApplicationCommand.fromJson);
  }

  /// Edit a global command. Updates will be available in all guilds after 1 hour.
  /// Returns 200 and an [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#edit-global-application-command
  Future<ValidatedResponse<Map<String, dynamic>, ApplicationCommand>>
      editGlobalApplicationCommand(
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
    return _dio.patch<Map<String, dynamic>>(
      '$_basePath/commands/$commandId',
      data: {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (options != null) 'options': options,
        if (defaultPermission != null) 'default_permission': defaultPermission,
      },
    ).validate(transform: ApplicationCommand.fromJson);
  }

  /// Deletes a global command. Returns 204.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#delete-global-application-command
  Future<ValidatedResponse<void, void>> deleteGlobalApplicationCommand(
    String commandId,
  ) {
    return _dio.delete('$_basePath/commands/$commandId').validate();
  }

  /// Takes a list of [ApplicationCommand]s, overwriting the existing global command list for this application.
  /// Updates will be available in all guilds after 1 hour. Returns 200 and a list of [ApplicationCommand] objects.
  /// Commands that do not already exist will count toward daily application command create limits.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#bulk-overwrite-global-application-commands
  Future<ValidatedResponse<List, List<ApplicationCommand>>>
      bulkOverwriteGlobalApplicationCommands(
    List<ApplicationCommand> commands,
  ) {
    return _dio.put<List>('$_basePath/commands', data: commands).validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(ApplicationCommand.fromJson)
              .toList(),
        );
  }

  /// Fetch all of the guild commands for your application for a specific guild.
  /// Returns an array of [ApplicationCommand] objects.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-guild-application-commands
  Future<ValidatedResponse<List, List<ApplicationCommand>>>
      getGuildApplicationCommands(
    String guildId,
  ) {
    return _dio.get<List>('$_basePath/guilds/$guildId/commands').validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(ApplicationCommand.fromJson)
              .toList(),
        );
  }

  /// Create a new guild command. New guild commands will be available in the guild immediately.
  /// Returns 201 and an [ApplicationCommand] object. If the command did not already exist,
  /// it will count toward daily application command create limits.
  ///
  /// Creating a command with the same name as an existing command for your application will overwrite the old command.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#create-guild-application-command
  Future<ValidatedResponse<Map<String, dynamic>, ApplicationCommand>>
      createGuildApplicationCommand(
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
    return _dio.post<Map<String, dynamic>>(
      '$_basePath/guilds/$guildId/commands',
      data: {
        'name': name,
        if (description != null) 'description': description,
        if (options != null) 'options': options,
        if (defaultPermission != null) 'default_permission': defaultPermission,
        if (type != null) 'type': type.value,
      },
    ).validate(transform: ApplicationCommand.fromJson);
  }

  /// Fetch a guild command for your application. Returns an [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-guild-application-command
  Future<ValidatedResponse<Map<String, dynamic>, ApplicationCommand>>
      getGuildApplicationCommand(
    String guildId, {
    required String commandId,
  }) {
    return _dio
        .get<Map<String, dynamic>>(
          '$_basePath/guilds/$guildId/commands/$commandId',
        )
        .validate(transform: ApplicationCommand.fromJson);
  }

  /// Edit a guild command. Updates for guild commands will be available immediately.
  /// Returns 200 and an [ApplicationCommand] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#edit-guild-application-command
  Future<ValidatedResponse<Map<String, dynamic>, ApplicationCommand>>
      editGuildApplicationCommand(
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
    return _dio.patch<Map<String, dynamic>>(
      '$_basePath/guilds/$guildId/commands/$commandId',
      data: {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (options != null) 'options': options,
        if (defaultPermission != null) 'default_permission': defaultPermission,
      },
    ).validate(transform: ApplicationCommand.fromJson);
  }

  /// Delete a guild command. Returns 204 on success.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#delete-guild-application-command
  Future<ValidatedResponse<void, void>> deleteGuildApplicationCommand(
    String guildId, {
    required String commandId,
  }) {
    return _dio
        .delete('$_basePath/guilds/$guildId/commands/$commandId')
        .validate();
  }

  /// Takes a list of application commands, overwriting the existing command list for this
  /// application for the targeted guild. Returns 200 and a list of [ApplicationCommand] objects.
  ///
  /// This will overwrite all types of application commands: slash commands, user commands, and message commands.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#bulk-overwrite-guild-application-commands
  Future<ValidatedResponse<List, List<ApplicationCommand>>>
      bulkOverwriteGuildApplicationCommands(
    String guildId, {
    required List<ApplicationCommand> commands,
  }) {
    return _dio
        .put<List>(
          '$_basePath/guilds/$guildId/commands',
          data: commands,
        )
        .validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(ApplicationCommand.fromJson)
              .toList(),
        );
  }

  /// Fetches command permissions for all commands for your application in a guild.
  /// Returns an array of [GuildApplicationCommandPermissions] objects.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-guild-application-command-permissions
  Future<ValidatedResponse<List, List<GuildApplicationCommandPermissions>>>
      getGuildApplicationCommandPermissions(String guildId) {
    return _dio
        .get<List>(
          '$_basePath/guilds/$guildId/commands/permissions',
        )
        .validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(GuildApplicationCommandPermissions.fromJson)
              .toList(),
        );
  }

  /// Fetches command permissions for a specific command for your application in a guild.
  /// Returns a [GuildApplicationCommandPermissions] object.
  ///
  /// https://discord.com/developers/docs/interactions/application-commands#get-application-command-permissions
  Future<
      ValidatedResponse<Map<String, dynamic>,
          GuildApplicationCommandPermissions>> getApplicationCommandPermissions(
    String guildId, {
    required String commandId,
  }) {
    return _dio
        .get<Map<String, dynamic>>(
          '$_basePath/guilds/$guildId/commands/$commandId/permissions',
        )
        .validate(
          transform: GuildApplicationCommandPermissions.fromJson,
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
  Future<
          ValidatedResponse<Map<String, dynamic>,
              GuildApplicationCommandPermissions>>
      editApplicationCommandPermissions(
    String guildId, {
    required String commandId,
    required List<ApplicationCommandPermissions> permissions,
  }) {
    return _dio.put<Map<String, dynamic>>(
      '$_basePath/guilds/$guildId/commands/$commandId/permissions',
      data: {'permissions': permissions},
    ).validate(
      transform: GuildApplicationCommandPermissions.fromJson,
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
  Future<ValidatedResponse<List, List<GuildApplicationCommandPermissions>>>
      batchEditApplicationCommandPermissions(
    String guildId, {
    required List<GuildApplicationCommandPermissions> permissions,
  }) {
    return _dio
        .put<List>(
          '$_basePath/guilds/$guildId/commands/permissions',
          data: permissions,
        )
        .validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(GuildApplicationCommandPermissions.fromJson)
              .toList(),
        );
  }
}
