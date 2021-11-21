// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/iso8601_converter.dart';

part 'voice_state.g.dart';

/// Voice State structure
///
/// https://discord.com/developers/docs/resources/voice#voice-state-object-voice-state-structure
@JsonSerializable()
class VoiceState {
  /// the guild id this voice state is for
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the channel id this user is connected to
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// the user id this voice state is for
  @JsonKey(name: 'user_id')
  final String userId;

  /// the guild member this voice state is for
  final GuildMember? member;

  /// the session id for this voice state
  @JsonKey(name: 'session_id')
  final String sessionId;

  /// whether this user is deafened by the server
  final bool deaf;

  /// whether this user is muted by the server
  final bool mute;

  /// whether this user is locally deafened
  @JsonKey(name: 'self_deaf')
  final bool selfDeaf;

  /// whether this user is locally muted
  @JsonKey(name: 'self_mute')
  final bool selfMute;

  /// whether this user is streaming using "Go Live"
  @JsonKey(name: 'self_stream')
  final bool? selfStream;

  /// whether this user's camera is enabled
  @JsonKey(name: 'self_video')
  final bool selfVideo;

  /// whether this user is muted by the current user
  final bool suppress;

  /// the time at which the user requested to speak
  @ISO8601ConverterNullable()
  @JsonKey(name: 'request_to_speak_timestamp')
  final DateTime? requestToSpeakTimestamp;

  /// Constructor
  VoiceState({
    this.guildId,
    this.channelId,
    required this.userId,
    this.member,
    required this.sessionId,
    required this.deaf,
    required this.mute,
    required this.selfDeaf,
    required this.selfMute,
    this.selfStream,
    required this.selfVideo,
    required this.suppress,
    this.requestToSpeakTimestamp,
  });

  /// From json
  factory VoiceState.fromJson(Map<String, dynamic> json) =>
      _$VoiceStateFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$VoiceStateToJson(this);
}
