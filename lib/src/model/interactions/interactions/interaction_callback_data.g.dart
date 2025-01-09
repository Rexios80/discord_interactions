// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
      flags: const MessageFlagConverter()
          .fromJson((json['flags'] as num?)?.toInt()),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ApplicationCommandOptionChoice.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InteractionCallbackDataToJson(
        InteractionCallbackData instance) =>
    <String, dynamic>{
      if (instance.tts case final value?) 'tts': value,
      if (instance.content case final value?) 'content': value,
      if (instance.embeds case final value?) 'embeds': value,
      if (instance.allowedMentions case final value?) 'allowed_mentions': value,
      if (const MessageFlagConverter().toJson(instance.flags) case final value?)
        'flags': value,
      if (instance.components case final value?) 'components': value,
      if (instance.attachments case final value?) 'attachments': value,
      if (instance.choices case final value?) 'choices': value,
    };
