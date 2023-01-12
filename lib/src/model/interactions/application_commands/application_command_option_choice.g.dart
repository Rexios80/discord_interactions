// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'application_command_option_choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationCommandOptionChoice _$ApplicationCommandOptionChoiceFromJson(
        Map<String, dynamic> json) =>
    ApplicationCommandOptionChoice(
      name: json['name'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$ApplicationCommandOptionChoiceToJson(
    ApplicationCommandOptionChoice instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}
