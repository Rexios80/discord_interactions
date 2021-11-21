// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'welcome_screen_channel.g.dart';

/// Welcome Screen Channel structure
///
/// https://discord.com/developers/docs/resources/guild#welcome-screen-object-welcome-screen-channel-structure
@JsonSerializable()
class WelcomeScreenChannel {
  /// the channel's id
  @JsonKey(name: 'channel_id')
  final String channelId;

  /// the description shown for the channel
  final String description;

  /// the emoji id, if the emoji is custom
  @JsonKey(name: 'emoji_id')
  final String? emojiId;

  /// the emoji name if custom, the unicode character if standard, or null if
  /// no emoji is set
  @JsonKey(name: 'emoji_name')
  final String? emojiName;

  /// Constructor
  WelcomeScreenChannel({
    required this.channelId,
    required this.description,
    this.emojiId,
    this.emojiName,
  });

  /// From json
  factory WelcomeScreenChannel.fromJson(Map<String, dynamic> json) =>
      _$WelcomeScreenChannelFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$WelcomeScreenChannelToJson(this);
}
