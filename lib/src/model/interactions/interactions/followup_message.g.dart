// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followup_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowupMessage _$FollowupMessageFromJson(Map<String, dynamic> json) =>
    FollowupMessage(
      content: json['content'] as String?,
      tts: json['tts'] as bool?,
      embeds: (json['embeds'] as List<dynamic>?)
          ?.map((e) => Embed.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedMentions: json['allowedMentions'] == null
          ? null
          : AllowedMentions.fromJson(
              json['allowedMentions'] as Map<String, dynamic>),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      flags: const MessageFlagConverter().fromJson(json['flags'] as int?),
    );

Map<String, dynamic> _$FollowupMessageToJson(FollowupMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'tts': instance.tts,
      'embeds': instance.embeds,
      'allowedMentions': instance.allowedMentions,
      'components': instance.components,
      'attachments': instance.attachments,
      'flags': const MessageFlagConverter().toJson(instance.flags),
    };
