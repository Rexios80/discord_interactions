// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'webhook.g.dart';

/// Webhook structure
///
/// https://discord.com/developers/docs/resources/webhook#webhook-object-webhook-structure
@JsonSerializable(includeIfNull: false)
class Webhook {
  /// the id of the webhook
  final String id;

  /// the type of the webhook
  final WebhookType type;

  /// the guild id this webhook is for, if any
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the channel id this webhook is for, if any
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// the user this webhook was created by (not returned when getting a webhook
  /// with its token)
  final User? user;

  /// the default name of the webhook
  final String? name;

  /// the default user avatar hash of the webhook
  final String? avatar;

  /// the secure token of the webhook (returned for Incoming Webhooks)
  final String? token;

  /// the bot/OAuth2 application that created this webhook
  @JsonKey(name: 'application_id')
  final String applicationId;

  /// the guild of the channel that this webhook is following (returned for
  /// Channel Follower Webhooks)
  @JsonKey(name: 'source_guild')
  final Guild? sourceGuild;

  /// the channel that this webhook is following (returned for Channel Follower
  /// Webhooks)
  @JsonKey(name: 'source_channel')
  final Channel? sourceChannel;

  /// the url used for executing the webhook (returned by the webhooks OAuth2
  /// flow)
  final String? url;

  /// Constructor
  Webhook({
    required this.id,
    required this.type,
    this.guildId,
    this.channelId,
    this.user,
    this.name,
    this.avatar,
    this.token,
    required this.applicationId,
    this.sourceGuild,
    this.sourceChannel,
    this.url,
  });

  /// From json
  factory Webhook.fromJson(Map<String, dynamic> json) =>
      _$WebhookFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$WebhookToJson(this);
}
