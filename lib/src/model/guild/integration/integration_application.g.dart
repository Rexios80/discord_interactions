// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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
    IntegrationApplication instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('icon', instance.icon);
  val['description'] = instance.description;
  val['summary'] = instance.summary;
  writeNotNull('bot', instance.bot);
  return val;
}
