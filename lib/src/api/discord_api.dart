// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/api/interactions/application_commands_api.dart';
import 'package:discord_interactions/src/api/interactions/interactions_api.dart';
import 'package:discord_interactions/src/api/users_api.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

/// Base class for accessing the Discord API
class DiscordApi {
  static const _baseUrl = 'https://discord.com/api/v9';

  final Dio _dio;

  /// Access to Application Commands API
  late final ApplicationCommandsApi applicationCommands;

  /// Access to Interactions API
  late final InteractionsApi interactions;

  /// Access to the Users API
  late final UsersApi users;

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
    applicationCommands = ApplicationCommandsApi(
      _dio,
      applicationId: applicationId,
    );
    interactions = InteractionsApi(_dio, applicationId: applicationId);
    users = UsersApi(_dio);
  }
}
