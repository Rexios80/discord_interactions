// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

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

Map<String, dynamic> _$ActivitySecretsToJson(ActivitySecrets instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('join', instance.join);
  writeNotNull('spectate', instance.spectate);
  writeNotNull('match', instance.match);
  return val;
}
