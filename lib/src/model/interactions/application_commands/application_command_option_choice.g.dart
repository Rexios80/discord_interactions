// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
        ApplicationCommandOptionChoice instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.value case final value?) 'value': value,
    };
