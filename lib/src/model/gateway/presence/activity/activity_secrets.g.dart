// GENERATED CODE - DO NOT MODIFY BY HAND

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
      'join': instance.join,
      'spectate': instance.spectate,
      'match': instance.match,
    };
