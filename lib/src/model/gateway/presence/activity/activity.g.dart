// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      name: json['name'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      url: json['url'] as String?,
      createdAt: const UnixTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      timestamps: json['timestamps'] == null
          ? null
          : ActivityTimestamps.fromJson(
              json['timestamps'] as Map<String, dynamic>),
      applicationId: json['application_id'] as String?,
      details: json['details'] as String?,
      state: json['state'] as String?,
      emoji: json['emoji'] == null
          ? null
          : Emoji.fromJson(json['emoji'] as Map<String, dynamic>),
      party: json['party'] == null
          ? null
          : ActivityParty.fromJson(json['party'] as Map<String, dynamic>),
      assets: json['assets'] == null
          ? null
          : ActivityAssets.fromJson(json['assets'] as Map<String, dynamic>),
      secrets: json['secrets'] == null
          ? null
          : ActivitySecrets.fromJson(json['secrets'] as Map<String, dynamic>),
      instance: json['instance'] as bool?,
      flags: const ActivityFlagConverter()
          .fromJson((json['flags'] as num?)?.toInt()),
      buttons: const ActivityButtonListConverter().fromJson(json['buttons']),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      if (instance.url case final value?) 'url': value,
      'created_at': const UnixTimeConverter().toJson(instance.createdAt),
      if (instance.timestamps case final value?) 'timestamps': value,
      if (instance.applicationId case final value?) 'application_id': value,
      if (instance.details case final value?) 'details': value,
      if (instance.state case final value?) 'state': value,
      if (instance.emoji case final value?) 'emoji': value,
      if (instance.party case final value?) 'party': value,
      if (instance.assets case final value?) 'assets': value,
      if (instance.secrets case final value?) 'secrets': value,
      if (instance.instance case final value?) 'instance': value,
      if (const ActivityFlagConverter().toJson(instance.flags)
          case final value?)
        'flags': value,
      if (const ActivityButtonListConverter().toJson(instance.buttons)
          case final value?)
        'buttons': value,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.game: 0,
  ActivityType.streaming: 1,
  ActivityType.listening: 2,
  ActivityType.watching: 3,
  ActivityType.custom: 4,
  ActivityType.competing: 5,
};
