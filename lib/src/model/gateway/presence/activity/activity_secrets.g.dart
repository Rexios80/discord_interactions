// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'activity_secrets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitySecrets _$ActivitySecretsFromJson(Map<String, dynamic> json) =>
    ActivitySecrets(
      join: json['join'] as String?,
      spectate: json['spectate'] as String?,
      match: json['match'] as String?,
    );

Map<String, dynamic> _$ActivitySecretsToJson(ActivitySecrets instance) =>
    <String, dynamic>{
      if (instance.join case final value?) 'join': value,
      if (instance.spectate case final value?) 'spectate': value,
      if (instance.match case final value?) 'match': value,
    };
