// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'integration.g.dart';

/// Integration structure
///
/// * These fields are not provided for discord bot integrations.
///
/// https://discord.com/developers/docs/resources/guild#integration-object-integration-structure
@JsonSerializable()
class Integration {
  /// integration id
  final String id;

  /// integration name
  final String name;

  /// integration type (twitch, youtube, or discord)
  final IntegrationType type;

  /// is this integration enabled
  final bool enabled;

  /// is this integration syncing
  ///
  /// *
  final bool? syncing;

  /// id that this integration uses for "subscribers"
  ///
  /// *
  @JsonKey(name: 'role_id')
  final String? roleId;

  /// whether emoticons should be synced for this integration (twitch only
  /// currently)
  ///
  /// *
  @JsonKey(name: 'enable_emoticons')
  final bool? enableEmoticons;

  /// the behavior of expiring subscribers
  ///
  /// *
  final IntegrationExpireBehavior? expireBehavior;

  /// the grace period (in days) before expiring subscribers
  ///
  /// *
  @JsonKey(name: 'expire_grace_period')
  final int? expireGracePeriod;

  /// user for this integration
  ///
  /// *
  final User? user;

  /// integration account information
  final IntegrationAccount account;

  /// when this integration was last synced
  ///
  /// *
  @JsonKey(name: 'synced_at')
  final DateTime? syncedAt;

  /// how many subscribers this integration has
  ///
  /// *
  @JsonKey(name: 'subscriber_count')
  final int? subscriberCount;

  /// has this integration been revoked
  ///
  /// *
  final bool? revoked;

  /// The bot/OAuth2 application for discord integrations
  final IntegrationApplication? application;

  /// Constructor
  Integration({
    required this.id,
    required this.name,
    required this.type,
    required this.enabled,
    this.syncing,
    this.roleId,
    this.enableEmoticons,
    this.expireBehavior,
    this.expireGracePeriod,
    this.user,
    required this.account,
    this.syncedAt,
    this.subscriberCount,
    this.revoked,
    this.application,
  });

  /// From json
  factory Integration.fromJson(Map<String, dynamic> json) =>
      _$IntegrationFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$IntegrationToJson(this);
}
