// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'message_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageReference _$MessageReferenceFromJson(Map<String, dynamic> json) =>
    MessageReference(
      messageId: json['message_id'] as String?,
      channelId: json['channel_id'] as String?,
      guildId: json['guild_id'] as String?,
      failIfNotExists: json['fail_if_not_exists'] as bool?,
    );

Map<String, dynamic> _$MessageReferenceToJson(MessageReference instance) =>
    <String, dynamic>{
      if (instance.messageId case final value?) 'message_id': value,
      if (instance.channelId case final value?) 'channel_id': value,
      if (instance.guildId case final value?) 'guild_id': value,
      if (instance.failIfNotExists case final value?)
        'fail_if_not_exists': value,
    };
