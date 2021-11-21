// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      name: json['name'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      url: json['url'] as String?,
      createdAt: const UnixTimeConverter().fromJson(json['created_at'] as int),
      timestamps: json['timestamps'],
      applicationId: json['application_id'] as String?,
      details: json['details'] as String?,
      state: json['state'] as String?,
      emoji: json['emoji'] == null
          ? null
          : Emoji.fromJson(json['emoji'] as Map<String, dynamic>),
      party: json['party'],
      assets: json['assets'],
      secrets: json['secrets'],
      instance: json['instance'] as bool?,
      flags: json['flags'] as List<dynamic>?,
      buttons: json['buttons'] as List<dynamic>?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$ActivityTypeEnumMap[instance.type],
      'url': instance.url,
      'created_at': const UnixTimeConverter().toJson(instance.createdAt),
      'timestamps': instance.timestamps,
      'application_id': instance.applicationId,
      'details': instance.details,
      'state': instance.state,
      'emoji': instance.emoji,
      'party': instance.party,
      'assets': instance.assets,
      'secrets': instance.secrets,
      'instance': instance.instance,
      'flags': instance.flags,
      'buttons': instance.buttons,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.game: 0,
  ActivityType.streaming: 1,
  ActivityType.listening: 2,
  ActivityType.watching: 3,
  ActivityType.custom: 4,
  ActivityType.competing: 5,
};
