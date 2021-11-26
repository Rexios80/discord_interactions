// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_guild_channel_positions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModifyGuildChannelPositionsParams _$ModifyGuildChannelPositionsParamsFromJson(
        Map<String, dynamic> json) =>
    ModifyGuildChannelPositionsParams(
      id: json['id'] as String,
      position: json['position'] as int?,
      lockPermissions: json['lock_permissions'] as bool?,
      parentId: json['parent_id'] as String?,
    );

Map<String, dynamic> _$ModifyGuildChannelPositionsParamsToJson(
    ModifyGuildChannelPositionsParams instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  writeNotNull('lock_permissions', instance.lockPermissions);
  writeNotNull('parent_id', instance.parentId);
  return val;
}
