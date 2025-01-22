// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/api/src/audit_logs_api.dart';
import 'package:discord_interactions/src/api/src/channels_api.dart';
import 'package:discord_interactions/src/api/src/emojis_api.dart';
import 'package:discord_interactions/src/api/src/guild_scheduled_events_api.dart';
import 'package:discord_interactions/src/api/src/guild_templates_api.dart';
import 'package:discord_interactions/src/api/src/guilds_api.dart';
import 'package:discord_interactions/src/api/src/interactions/application_commands_api.dart';
import 'package:discord_interactions/src/api/src/interactions/interactions_api.dart';
import 'package:discord_interactions/src/api/src/invites_api.dart';
import 'package:discord_interactions/src/api/src/stage_instances_api.dart';
import 'package:discord_interactions/src/api/src/stickers_api.dart';
import 'package:discord_interactions/src/api/src/users_api.dart';
import 'package:discord_interactions/src/api/src/voice_api.dart';
import 'package:discord_interactions/src/api/src/webhooks_api.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

/// Base class for accessing the Discord API
///
/// https://discord.com/developers/docs/intro
class DiscordApi {
  static const _baseUrl = 'https://discord.com/api/v9';

  /// The dio instance used for making requests
  /// 
  /// This is public to allow injecting a custom `HttpClientAdapter`
  final Dio dio;

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

  /// Access to the Guild Scheduled Events API
  late final GuildScheduledEventsApi guildScheduledEvents;

  /// Access to the Guild Templates API
  late final GuildTemplatesApi guildTemplates;

  /// Access to the Guilds API
  late final GuildsApi guilds;

  /// Access to the Invites API
  late final InvitesApi invites;

  /// Access to the Stage Instances API
  late final StageInstancesApi stageInstances;

  /// Access to the Stickers API
  late final StickersApi stickers;

  /// Access to the Users API
  late final UsersApi users;

  /// Access to the Voice API
  late final VoiceApi voice;

  /// Access to the Webhooks API
  late final WebhooksApi webhooks;

  /// Access to the Discord API
  ///
  /// One of [botToken], [credentialsToken] is required
  DiscordApi({
    required String applicationId,
    required DiscordUserAgent userAgent,
    String? botToken,
    String? credentialsToken,
  })  : assert(botToken != null || credentialsToken != null),
        dio = Dio(
          BaseOptions(
            baseUrl: _baseUrl,
            headers: {
              'User-Agent': userAgent.toString(),
              'Content-Type': 'application/json',
              if (botToken != null) 'Authorization': 'Bot $botToken',
              if (credentialsToken != null)
                'Authorization': 'Bearer $credentialsToken',
            },
          ),
        ) {
    applicationCommands = ApplicationCommandsApi(
      dio,
      applicationId: applicationId,
    );
    interactions = InteractionsApi(dio, applicationId: applicationId);
    auditLogs = AuditLogsApi(dio);
    channels = ChannelsApi(dio);
    emojis = EmojisApi(dio);
    guildScheduledEvents = GuildScheduledEventsApi(dio);
    guildTemplates = GuildTemplatesApi(dio);
    guilds = GuildsApi(dio);
    invites = InvitesApi(dio);
    stageInstances = StageInstancesApi(dio);
    stickers = StickersApi(dio);
    users = UsersApi(dio);
    voice = VoiceApi(dio);
    webhooks = WebhooksApi(dio);
  }
}
