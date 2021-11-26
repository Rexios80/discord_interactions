// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'followed_channel.g.dart';

/// Followed Channel structure
///
/// https://discord.com/developers/docs/resources/channel#followed-channel-object-followed-channel-structure
@JsonSerializable(includeIfNull: false)
class FollowedChannel {
  /// source channel id
  @JsonKey(name: 'channel_id')
  final String channelId;

  /// created target webhook id
  @JsonKey(name: 'webhook_id')
  final String webhookId;

  /// Constructor
  FollowedChannel({
    required this.channelId,
    required this.webhookId,
  });

  /// From json
  factory FollowedChannel.fromJson(Map<String, dynamic> json) =>
      _$FollowedChannelFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$FollowedChannelToJson(this);
}
