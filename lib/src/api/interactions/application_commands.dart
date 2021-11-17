import 'package:dio/dio.dart';
import 'package:discord_interactions/src/model/interactions/application_commands/application_command.dart';

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

  /// Create global command
  Future<Response> createGlobalCommand(ApplicationCommand command) {
    return _dio.post('/$_path/commands', data: command.toJson());
  }

  /// Create guild command
  Future<Response> createGuildCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return _dio.post('/$_path/guilds/$guildId/commands', data: command.toJson());
  }

  /// Update global command
  Future<Response> updateGlobalCommand(ApplicationCommand command) {
    return _dio.patch('/$_path/commands/${command.id}', data: command.toJson());
  }

  /// Update guild command
  Future<Response> updateGuildCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return _dio.patch(
      '/$_path/guilds/$guildId/commands/${command.id}',
      data: command.toJson(),
    );
  }

  /// Delete global command
  Future<Response> deleteGlobalCommand(String commandId) {
    return _dio.delete('/$_path/commands/$commandId');
  }

  /// Delete guild command
  Future<Response> deleteGuildCommand(
    String commandId, {
    required String guildId,
  }) {
    return _dio.delete('/$_path/guilds/$guildId/commands/$commandId');
  }

  // TODO: Other endpoints
}
