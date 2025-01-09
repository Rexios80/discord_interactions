// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'followed_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowedChannel _$FollowedChannelFromJson(Map<String, dynamic> json) =>
    FollowedChannel(
      channelId: json['channel_id'] as String,
      webhookId: json['webhook_id'] as String,
    );

Map<String, dynamic> _$FollowedChannelToJson(FollowedChannel instance) =>
    <String, dynamic>{
      'channel_id': instance.channelId,
      'webhook_id': instance.webhookId,
    };
