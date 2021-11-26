// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/api/src/audit_logs_api.dart';
import 'package:discord_interactions/src/api/src/channels_api.dart';
import 'package:discord_interactions/src/api/src/emojis_api.dart';
import 'package:discord_interactions/src/api/src/interactions/application_commands_api.dart';
import 'package:discord_interactions/src/api/src/interactions/interactions_api.dart';
import 'package:discord_interactions/src/api/src/invites_api.dart';
import 'package:discord_interactions/src/api/src/stage_instances_api.dart';
import 'package:discord_interactions/src/api/src/users_api.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

/// Base class for accessing the Discord API
///
/// https://discord.com/developers/docs/intro
class DiscordApi {
  static const _baseUrl = 'https://discord.com/api/v9';

  final Dio _dio;

  /// Access to Application Commands API
  late final ApplicationCommandsApi applicationCommands;

  /// Access to Interactions API
  late final InteractionsApi interactions;

  /// Access to the Audit Logs API
  late final AuditLogsApi auditLogs;

  /// Access to the Channels API
  late final ChannelsApi channels;

  /// Access to the Emojis API
  late final EmojisApi emojis;

  /// Access to the Invites API
  late final InvitesApi invites;

  /// Access to the Stage Instances API
  late final StageInstancesApi stageInstances;

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
    auditLogs = AuditLogsApi(_dio);
    channels = ChannelsApi(_dio);
    emojis = EmojisApi(_dio);
    invites = InvitesApi(_dio);
    stageInstances = StageInstancesApi(_dio);
    users = UsersApi(_dio);
  }
}
