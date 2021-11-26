// GENERATED CODE - DO NOT MODIFY BY HAND

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

Map<String, dynamic> _$MessageReferenceToJson(MessageReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_id', instance.messageId);
  writeNotNull('channel_id', instance.channelId);
  writeNotNull('guild_id', instance.guildId);
  writeNotNull('fail_if_not_exists', instance.failIfNotExists);
  return val;
}
