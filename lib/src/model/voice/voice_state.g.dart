// GENERATED CODE - DO NOT MODIFY BY HAND

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
      requestToSpeakTimestamp: const ISO8601ConverterNullable()
          .fromJson(json['request_to_speak_timestamp'] as String?),
    );

Map<String, dynamic> _$VoiceStateToJson(VoiceState instance) =>
    <String, dynamic>{
      'guild_id': instance.guildId,
      'channel_id': instance.channelId,
      'user_id': instance.userId,
      'member': instance.member,
      'session_id': instance.sessionId,
      'deaf': instance.deaf,
      'mute': instance.mute,
      'self_deaf': instance.selfDeaf,
      'self_mute': instance.selfMute,
      'self_stream': instance.selfStream,
      'self_video': instance.selfVideo,
      'suppress': instance.suppress,
      'request_to_speak_timestamp': const ISO8601ConverterNullable()
          .toJson(instance.requestToSpeakTimestamp),
    };