// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'guild_scheduled_event_entity_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildScheduledEventEntityMetadata _$GuildScheduledEventEntityMetadataFromJson(
        Map<String, dynamic> json) =>
    GuildScheduledEventEntityMetadata(
      location: json['location'] as String?,
    );

Map<String, dynamic> _$GuildScheduledEventEntityMetadataToJson(
    GuildScheduledEventEntityMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  return val;
}
