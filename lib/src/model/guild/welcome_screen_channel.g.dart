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
    WelcomeScreenChannel instance) {
  final val = <String, dynamic>{
    'channel_id': instance.channelId,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emoji_id', instance.emojiId);
  writeNotNull('emoji_name', instance.emojiName);
  return val;
}
