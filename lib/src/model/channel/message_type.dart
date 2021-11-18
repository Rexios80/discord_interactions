// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Message types
enum MessageType {
  /// default message type
  @JsonValue(0)
  defaultType,

  /// recipient add
  @JsonValue(1)
  recipientAdd,

  /// recipient remove
  @JsonValue(2)
  recipientRemove,

  /// call
  @JsonValue(3)
  call,

  /// channel name change
  @JsonValue(4)
  channelNameChange,

  /// channel icon change
  @JsonValue(5)
  channelIconChange,

  /// channel pinned message
  @JsonValue(6)
  channelPinnedMessage,

  /// guild member join
  @JsonValue(7)
  guildMemberJoin,

  /// user premium guild subscription
  @JsonValue(8)
  userPremiumGuildSubscription,

  /// user premium guild subscription tier 1
  @JsonValue(9)
  userPremiumGuildSubscriptionTier1,

  /// user premium guild subscription tier 2
  @JsonValue(10)
  userPremiumGuildSubscriptionTier2,

  /// user premium guild subscription tier 3
  @JsonValue(11)
  userPremiumGuildSubscriptionTier3,

  /// channel follow add
  @JsonValue(12)
  channelFollowAdd,

  /// guild discovery disqualified
  @JsonValue(14)
  guildDiscoveryDisqualified,

  /// guild discovery requalified
  @JsonValue(15)
  guildDiscoveryRequalified,

  /// guild discovery grace period initial warning
  @JsonValue(16)
  guildDiscoveryGracePeriodInitialWarning,

  /// guild discovery grace period final warning
  @JsonValue(17)
  guildDiscoveryGracePeriodFinalWarning,

  /// thread created
  @JsonValue(18)
  threadCreated,

  /// reply
  @JsonValue(19)
  reply,

  /// chat input command
  @JsonValue(20)
  chatInputCommand,

  /// thread starter message
  @JsonValue(21)
  threadStarterMessage,

  /// guild invite reminder
  @JsonValue(22)
  guildInviteReminder,

  /// context menu command
  @JsonValue(23)
  contextMenuCommand,
}
