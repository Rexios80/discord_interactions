// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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

Map<String, dynamic> _$VoiceStateToJson(VoiceState instance) =>
    <String, dynamic>{
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.channelId case final value?) 'channel_id': value,
      'user_id': instance.userId,
      if (instance.member case final value?) 'member': value,
      'session_id': instance.sessionId,
      'deaf': instance.deaf,
      'mute': instance.mute,
      'self_deaf': instance.selfDeaf,
      'self_mute': instance.selfMute,
      if (instance.selfStream case final value?) 'self_stream': value,
      'self_video': instance.selfVideo,
      'suppress': instance.suppress,
      if (instance.requestToSpeakTimestamp?.toIso8601String() case final value?)
        'request_to_speak_timestamp': value,
    };
