// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/api/interactions/application_commands.dart';
import 'package:discord_interactions/src/api/interactions/interactions.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

/// Base class for accessing the Discord API
class DiscordApi {
  static const _baseUrl = 'https://discord.com/api/v9';

  final Dio _dio;

  /// Access to Application Commands api
  late final ApplicationCommands applicationCommands;

  /// Access to Interactions api
  late final Interactions interactions;

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
    interactions = Interactions(_dio, applicationId: applicationId);
  }
}
