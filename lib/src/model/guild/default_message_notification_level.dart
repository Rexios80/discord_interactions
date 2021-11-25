// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Default Message Notification levels
///
/// https://discord.com/developers/docs/resources/guild#guild-object-default-message-notification-level
enum DefaultMessageNotificationLevel {
  /// members will receive notifications for all messages by default
  @JsonValue(0)
  allMessages,

  /// members will receive notifications only for messages that @mention them by default
  @JsonValue(1)
  onlyMentions,
}

/// Extension on [DefaultMessageNotificationLevel]
extension DefaultMessageNotificationLevelExtension
    on DefaultMessageNotificationLevel {
  static const _enumMap = <DefaultMessageNotificationLevel, int>{
    DefaultMessageNotificationLevel.allMessages: 0,
    DefaultMessageNotificationLevel.onlyMentions: 1,
  };

  /// Get the int value of the enum
  int get value => _enumMap[this]!;

  /// Create a [DefaultMessageNotificationLevel] from an int
  static DefaultMessageNotificationLevel fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
