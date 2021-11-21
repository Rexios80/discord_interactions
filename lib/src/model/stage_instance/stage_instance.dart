// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'stage_instance.g.dart';

/// Stage Instance structure
///
/// https://discord.com/developers/docs/resources/stage-instance#stage-instance-object-stage-instance-structure
@JsonSerializable()
class StageInstance {
  /// The id of this Stage instance
  final String id;

  /// The guild id of the associated Stage channel
  @JsonKey(name: 'guild_id')
  final String guildId;

  /// The id of the associated Stage channel
  @JsonKey(name: 'channel_id')
  final String channelId;

  /// The topic of the Stage instance (1-120 characters)
  final String topic;

  /// The privacy level of the Stage instance
  @JsonKey(name: 'privacy_level')
  final StageInstancePrivacyLevel privacyLevel;

  /// Whether or not Stage Discovery is disabled
  @JsonKey(name: 'discovery_disabled')
  final bool discoveryDisabled;

  /// Constructor
  StageInstance({
    required this.id,
    required this.guildId,
    required this.channelId,
    required this.topic,
    required this.privacyLevel,
    required this.discoveryDisabled,
  });

  /// From json
  factory StageInstance.fromJson(Map<String, dynamic> json) =>
      _$StageInstanceFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$StageInstanceToJson(this);
}
