// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_guild_role_positions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifyGuildRolePositionsParams _$ModifyGuildRolePositionsParamsFromJson(
        Map<String, dynamic> json) =>
    ModifyGuildRolePositionsParams(
      id: json['id'] as String,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$ModifyGuildRolePositionsParamsToJson(
    ModifyGuildRolePositionsParams instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  return val;
}
