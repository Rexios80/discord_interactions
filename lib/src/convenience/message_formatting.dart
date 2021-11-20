import 'package:discord_interactions/discord_interactions.dart';

/// Discord utilizes a subset of markdown for rendering message content on its
/// clients, while also adding some custom functionality to enable things like
/// mentioning users and channels.
///
/// https://discord.com/developers/docs/reference#message-formatting
class MessageFormatting {
  /// <@USER_ID>
  String user(Snowflake userId) => '<@$userId>';

  /// <@!USER_ID>
  String userNickname(Snowflake userId) => '<@!$userId>';

  /// <#CHANNEL_ID>
  String channel(Snowflake channelId) => '<#$channelId>';

  /// <@&ROLE_ID>
  String role(Snowflake roleId) => '<@&$roleId>';

  /// <:NAME:ID>
  String emoji(String name, Snowflake emojiId) => '<:$name:$emojiId>';

  /// <a:NAME:ID>
  String emojiAnimated(String name, Snowflake emojiId) => '<a:$name:$emojiId>';

  /// <t:TIMESTAMP>
  String timestamp(DateTime timestamp) =>
      '<t:${timestamp.millisecondsSinceEpoch / 1000}>';

  /// <t:TIMESTAMP:STYLE>
  String timestampStyled(DateTime timestamp, TimestampStyle style) =>
      '<t:${timestamp.millisecondsSinceEpoch / 1000}:${style.value}>';
}

/// Timestamps will display the given timestamp in the user's timezone and locale
///
/// https://discord.com/developers/docs/reference#message-formatting-timestamp-styles
enum TimestampStyle {
  /// Example: 16:20
  shortTime,

  /// Example: 16:20:30
  longTime,

  /// Example: 20/04/2021
  shortDate,

  /// Example: 20 April 2021
  longDate,

  /// Example: 20 April 2021 16:20
  ///
  /// default
  shortDateTime,

  /// Example: Tuesday, 20 April 2021 16:20
  longDateTime,

  /// Example: 2 months ago
  relativeTime,
}

extension on TimestampStyle {
  String get value {
    switch (this) {
      case TimestampStyle.shortTime:
        return 't';
      case TimestampStyle.longTime:
        return 'T';
      case TimestampStyle.shortDate:
        return 'd';
      case TimestampStyle.longDate:
        return 'D';
      case TimestampStyle.shortDateTime:
        return 'f';
      case TimestampStyle.longDateTime:
        return 'F';
      case TimestampStyle.relativeTime:
        return 'R';
    }
  }
}
