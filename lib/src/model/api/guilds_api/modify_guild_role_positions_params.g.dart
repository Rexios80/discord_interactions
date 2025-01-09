// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'modify_guild_role_positions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifyGuildRolePositionsParams _$ModifyGuildRolePositionsParamsFromJson(
        Map<String, dynamic> json) =>
    ModifyGuildRolePositionsParams(
      id: json['id'] as String,
      position: (json['position'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ModifyGuildRolePositionsParamsToJson(
        ModifyGuildRolePositionsParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.position case final value?) 'position': value,
    };
