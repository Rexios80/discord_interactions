// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'integration_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntegrationApplication _$IntegrationApplicationFromJson(
        Map<String, dynamic> json) =>
    IntegrationApplication(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      description: json['description'] as String,
      summary: json['summary'] as String,
      bot: json['bot'] == null
          ? null
          : User.fromJson(json['bot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntegrationApplicationToJson(
        IntegrationApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.icon case final value?) 'icon': value,
      'description': instance.description,
      'summary': instance.summary,
      if (instance.bot case final value?) 'bot': value,
    };
