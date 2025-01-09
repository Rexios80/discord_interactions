// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'guild_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildWidget _$GuildWidgetFromJson(Map<String, dynamic> json) => GuildWidget(
      enabled: json['enabled'] as bool,
      channelId: json['channel_id'] as String?,
    );

Map<String, dynamic> _$GuildWidgetToJson(GuildWidget instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      if (instance.channelId case final value?) 'channel_id': value,
    };
