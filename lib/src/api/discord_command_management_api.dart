import 'package:dio/dio.dart';
import 'package:discord_interactions/src/model/application_command.dart';

/// Client for creating, updating, and deleting [ApplicationCommand]s
class DiscordCommandManagementApi {
  static const _baseUrl = 'https://discord.com/api/v8/applications';

  final Dio _dio;

  /// Creates a new instance of [DiscordCommandManagementApi]
  DiscordCommandManagementApi({
    required String applicationId,
    String? botToken,
    String? credentialsToken,
  })  : assert(botToken != null || credentialsToken != null),
        _dio = Dio(
          BaseOptions(
            baseUrl: '$_baseUrl/$applicationId',
            headers: {
              if (botToken != null) 'Authorization': 'Bot $botToken',
              if (credentialsToken != null)
                'Authorization': 'Bearer $credentialsToken',
            },
          ),
        );

  /// Create global command
  Future<Response> createGlobalCommand(ApplicationCommand command) {
    return _dio.post('/commands', data: command.toJson());
  }

  /// Create guild command
  Future<Response> createGuildCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return _dio.post('/guilds/$guildId/commands', data: command.toJson());
  }

  /// Update global command
  Future<Response> updateGlobalCommand(ApplicationCommand command) {
    return _dio.patch('/commands/${command.id}', data: command.toJson());
  }

  /// Update guild command
  Future<Response> updateGuildCommand(
    ApplicationCommand command, {
    required String guildId,
  }) {
    return _dio.patch(
      '/guilds/$guildId/commands/${command.id}',
      data: command.toJson(),
    );
  }

  /// Delete global command
  Future<Response> deleteGlobalCommand(String commandId) {
    return _dio.delete('/commands/$commandId');
  }

  /// Delete guild command
  Future<Response> deleteGuildCommand(
    String commandId, {
    required String guildId,
  }) {
    return _dio.delete('/guilds/$guildId/commands/$commandId');
  }
}
