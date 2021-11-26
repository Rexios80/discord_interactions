// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildWidget _$GuildWidgetFromJson(Map<String, dynamic> json) => GuildWidget(
      enabled: json['enabled'] as bool,
      channelId: json['channel_id'] as String?,
    );

Map<String, dynamic> _$GuildWidgetToJson(GuildWidget instance) {
  final val = <String, dynamic>{
    'enabled': instance.enabled,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channel_id', instance.channelId);
  return val;
}
