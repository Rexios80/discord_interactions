// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_command_interaction_data_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommandInteractionDataOption
    _$ApplicationCommandInteractionDataOptionFromJson(
            Map<String, dynamic> json) =>
        ApplicationCommandInteractionDataOption(
          name: json['name'] as String,
          type:
              $enumDecode(_$ApplicationCommandOptionTypeEnumMap, json['type']),
          value: json['value'],
          options: (json['options'] as List<dynamic>?)
              ?.map((e) => ApplicationCommandInteractionDataOption.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          focused: json['focused'] as bool?,
        );

Map<String, dynamic> _$ApplicationCommandInteractionDataOptionToJson(
    ApplicationCommandInteractionDataOption instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'type': _$ApplicationCommandOptionTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('options', instance.options);
  writeNotNull('focused', instance.focused);
  return val;
}

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
