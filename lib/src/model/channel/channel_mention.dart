// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'channel_mention.g.dart';

/// Channel mention structure
/// 
/// https://discord.com/developers/docs/resources/channel#channel-mention-object-channel-mention-structure
@JsonSerializable()
class ChannelMention {
  /// id of the channel
  final String id;

  /// id of the guild containing the channel
  @JsonKey(name: 'guild_id')
  final String guildId;

  /// the type of channel
  final ChannelType type;

  /// the name of the channel
  final String name;

  /// Constructor
  ChannelMention({
    required this.id,
    required this.guildId,
    required this.type,
    required this.name,
  });

  /// From json
  factory ChannelMention.fromJson(Map<String, dynamic> json) =>
      _$ChannelMentionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ChannelMentionToJson(this);
}
