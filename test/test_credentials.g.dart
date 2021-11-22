// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestCredentials _$TestCredentialsFromJson(Map<String, dynamic> json) =>
    TestCredentials(
      applicationId: json['applicationId'] as String,
      botToken: json['botToken'] as String,
      userAgentUrl: json['userAgentUrl'] as String,
      guildId: json['guildId'] as String,
      roleId: json['roleId'] as String,
      roleIconId: json['roleIconId'] as String,
      channelId: json['channelId'] as String,
      userId: json['userId'] as String,
      emojiName: json['emojiName'] as String,
      emojiId: json['emojiId'] as String,
      stickerId: json['stickerId'] as String,
    );

Map<String, dynamic> _$TestCredentialsToJson(TestCredentials instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'botToken': instance.botToken,
      'userAgentUrl': instance.userAgentUrl,
      'guildId': instance.guildId,
      'roleId': instance.roleId,
      'roleIconId': instance.roleIconId,
      'channelId': instance.channelId,
      'userId': instance.userId,
      'emojiName': instance.emojiName,
      'emojiId': instance.emojiId,
      'stickerId': instance.stickerId,
    };
