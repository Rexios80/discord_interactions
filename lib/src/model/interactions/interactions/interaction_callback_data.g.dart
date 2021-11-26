// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_callback_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractionCallbackData _$InteractionCallbackDataFromJson(
        Map<String, dynamic> json) =>
    InteractionCallbackData(
      tts: json['tts'] as bool?,
      content: json['content'] as String?,
      embeds: (json['embeds'] as List<dynamic>?)
          ?.map((e) => Embed.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedMentions: json['allowed_mentions'] == null
          ? null
          : AllowedMentions.fromJson(
              json['allowed_mentions'] as Map<String, dynamic>),
      flags: const MessageFlagConverter().fromJson(json['flags'] as int?),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InteractionCallbackDataToJson(
    InteractionCallbackData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tts', instance.tts);
  writeNotNull('content', instance.content);
  writeNotNull('embeds', instance.embeds);
  writeNotNull('allowed_mentions', instance.allowedMentions);
  writeNotNull('flags', const MessageFlagConverter().toJson(instance.flags));
  writeNotNull('components', instance.components);
  writeNotNull('attachments', instance.attachments);
  return val;
}
