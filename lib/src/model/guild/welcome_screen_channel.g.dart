// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'welcome_screen_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelcomeScreenChannel _$WelcomeScreenChannelFromJson(
        Map<String, dynamic> json) =>
    WelcomeScreenChannel(
      channelId: json['channel_id'] as String,
      description: json['description'] as String,
      emojiId: json['emoji_id'] as String?,
      emojiName: json['emoji_name'] as String?,
    );

Map<String, dynamic> _$WelcomeScreenChannelToJson(
        WelcomeScreenChannel instance) =>
    <String, dynamic>{
      'channel_id': instance.channelId,
      'description': instance.description,
      if (instance.emojiId case final value?) 'emoji_id': value,
      if (instance.emojiName case final value?) 'emoji_name': value,
    };
