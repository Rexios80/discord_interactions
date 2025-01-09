// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'modify_guild_channel_positions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifyGuildChannelPositionsParams _$ModifyGuildChannelPositionsParamsFromJson(
        Map<String, dynamic> json) =>
    ModifyGuildChannelPositionsParams(
      id: json['id'] as String,
      position: (json['position'] as num?)?.toInt(),
      lockPermissions: json['lock_permissions'] as bool?,
      parentId: json['parent_id'] as String?,
    );

Map<String, dynamic> _$ModifyGuildChannelPositionsParamsToJson(
        ModifyGuildChannelPositionsParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.position case final value?) 'position': value,
      if (instance.lockPermissions case final value?) 'lock_permissions': value,
      if (instance.parentId case final value?) 'parent_id': value,
    };
