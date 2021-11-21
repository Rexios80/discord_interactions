// GENERATED CODE - DO NOT MODIFY BY HAND

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
      'emoji_id': instance.emojiId,
      'emoji_name': instance.emojiName,
    };
