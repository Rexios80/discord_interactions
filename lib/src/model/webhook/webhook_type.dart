// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Webhook types
///
/// https://discord.com/developers/docs/resources/webhook#webhook-object-webhook-types
enum WebhookType {
  /// Incoming Webhooks can post messages to channels with a generated token
  @JsonValue(1)
  incoming,

  /// Channel Follower Webhooks are internal webhooks used with Channel
  /// Following to post new messages into channels
  @JsonValue(2)
  channelFollower,

  /// Application webhooks are webhooks used with Interactions
  @JsonValue(3)
  application,
}
