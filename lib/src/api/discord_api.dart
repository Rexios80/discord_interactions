import 'package:dio/dio.dart';
import 'package:discord_interactions/src/model/discord_user_agent.dart';

import 'interactions/application_commands.dart';

/// Base class for accessing the Discord API
class DiscordApi {
  static const _baseUrl = 'https://discord.com/api/v9';

  final Dio _dio;

  /// Access to Application Commands api
  late final ApplicationCommands applicationCommands;

  /// Access to the Discord API
  DiscordApi({
    required String applicationId,
    required DiscordUserAgent userAgent,
    String? botToken,
    String? credentialsToken,
  })  : assert(botToken != null || credentialsToken != null),
        _dio = Dio(
          BaseOptions(
            baseUrl: _baseUrl,
            headers: {
              'User-Agent': userAgent.toString(),
              if (botToken != null) 'Authorization': 'Bot $botToken',
              if (credentialsToken != null)
                'Authorization': 'Bearer $credentialsToken',
            },
          ),
        ) {
    applicationCommands = ApplicationCommands(
      _dio,
      applicationId: applicationId,
    );
  }
}
