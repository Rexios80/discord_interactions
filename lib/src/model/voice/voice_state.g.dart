// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'voice_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceState _$VoiceStateFromJson(Map<String, dynamic> json) => VoiceState(
      guildId: json['guild_id'] as String?,
      channelId: json['channel_id'] as String?,
      userId: json['user_id'] as String,
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
      sessionId: json['session_id'] as String,
      deaf: json['deaf'] as bool,
      mute: json['mute'] as bool,
      selfDeaf: json['self_deaf'] as bool,
      selfMute: json['self_mute'] as bool,
      selfStream: json['self_stream'] as bool?,
      selfVideo: json['self_video'] as bool,
      suppress: json['suppress'] as bool,
      requestToSpeakTimestamp: json['request_to_speak_timestamp'] == null
          ? null
          : DateTime.parse(json['request_to_speak_timestamp'] as String),
    );

Map<String, dynamic> _$VoiceStateToJson(VoiceState instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guild_id', instance.guildId);
  writeNotNull('channel_id', instance.channelId);
  val['user_id'] = instance.userId;
  writeNotNull('member', instance.member);
  val['session_id'] = instance.sessionId;
  val['deaf'] = instance.deaf;
  val['mute'] = instance.mute;
  val['self_deaf'] = instance.selfDeaf;
  val['self_mute'] = instance.selfMute;
  writeNotNull('self_stream', instance.selfStream);
  val['self_video'] = instance.selfVideo;
  val['suppress'] = instance.suppress;
  writeNotNull('request_to_speak_timestamp',
      instance.requestToSpeakTimestamp?.toIso8601String());
  return val;
}
