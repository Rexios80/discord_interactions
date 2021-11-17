// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_command_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommandOption _$ApplicationCommandOptionFromJson(
        Map<String, dynamic> json) =>
    ApplicationCommandOption(
      type: $enumDecode(_$ApplicationCommandOptionTypeEnumMap, json['type']),
      name: json['name'] as String,
      description: json['description'] as String,
      required: json['required'] as bool? ?? false,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ApplicationCommandOptionChoice.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              ApplicationCommandOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelTypes: (json['channel_types'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ChannelTypeEnumMap, e))
          .toList(),
      minValue: json['min_value'] as num?,
      maxValue: json['max_value'] as num?,
      autocomplete: json['autocomplete'] as bool?,
    );

Map<String, dynamic> _$ApplicationCommandOptionToJson(
        ApplicationCommandOption instance) =>
    <String, dynamic>{
      'type': _$ApplicationCommandOptionTypeEnumMap[instance.type],
      'name': instance.name,
      'description': instance.description,
      'required': instance.required,
      'choices': instance.choices,
      'options': instance.options,
      'channel_types':
          instance.channelTypes?.map((e) => _$ChannelTypeEnumMap[e]).toList(),
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'autocomplete': instance.autocomplete,
    };

const _$ApplicationCommandOptionTypeEnumMap = {
  ApplicationCommandOptionType.subCommand: 1,
  ApplicationCommandOptionType.subCommandGroup: 2,
  ApplicationCommandOptionType.string: 3,
  ApplicationCommandOptionType.integer: 4,
  ApplicationCommandOptionType.boolean: 5,
  ApplicationCommandOptionType.user: 6,
  ApplicationCommandOptionType.channel: 7,
  ApplicationCommandOptionType.role: 8,
  ApplicationCommandOptionType.mentionable: 9,
  ApplicationCommandOptionType.number: 10,
};

const _$ChannelTypeEnumMap = {
  ChannelType.guildText: 0,
  ChannelType.dm: 1,
  ChannelType.guildVoice: 2,
  ChannelType.groupDm: 3,
  ChannelType.guildCategory: 4,
  ChannelType.guildNews: 5,
  ChannelType.guildStore: 6,
  ChannelType.guildNewsThread: 10,
  ChannelType.guildPublicThread: 11,
  ChannelType.guildPrivateThread: 12,
  ChannelType.guildStageVoice: 13,
};

ApplicationCommandOptionChoice _$ApplicationCommandOptionChoiceFromJson(
        Map<String, dynamic> json) =>
    ApplicationCommandOptionChoice(
      name: json['name'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$ApplicationCommandOptionChoiceToJson(
        ApplicationCommandOptionChoice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
