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
      flags: const ActivityFlagConverter().fromJson(json['flags'] as int?),
      buttons: const ActivityButtonListConverter().fromJson(json['buttons']),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'type': _$ActivityTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  val['created_at'] = const UnixTimeConverter().toJson(instance.createdAt);
  writeNotNull('timestamps', instance.timestamps);
  writeNotNull('application_id', instance.applicationId);
  writeNotNull('details', instance.details);
  writeNotNull('state', instance.state);
  writeNotNull('emoji', instance.emoji);
  writeNotNull('party', instance.party);
  writeNotNull('assets', instance.assets);
  writeNotNull('secrets', instance.secrets);
  writeNotNull('instance', instance.instance);
  writeNotNull('flags', const ActivityFlagConverter().toJson(instance.flags));
  writeNotNull(
      'buttons', const ActivityButtonListConverter().toJson(instance.buttons));
  return val;
}

const _$ActivityTypeEnumMap = {
  ActivityType.game: 0,
  ActivityType.streaming: 1,
  ActivityType.listening: 2,
  ActivityType.watching: 3,
  ActivityType.custom: 4,
  ActivityType.competing: 5,
};
