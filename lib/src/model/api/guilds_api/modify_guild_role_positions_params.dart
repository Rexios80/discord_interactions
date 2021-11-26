// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'modify_guild_role_positions_params.g.dart';

/// Modify Guild Role Positions params
///
/// https://discord.com/developers/docs/resources/guild#modify-guild-role-positions-json-params
@JsonSerializable(includeIfNull: false)
class ModifyGuildRolePositionsParams {
  /// id
  final String id;

  /// sorting position of the role
  final int? position;

  /// Constructor
  ModifyGuildRolePositionsParams({
    required this.id,
    this.position,
  });

  /// From json
  factory ModifyGuildRolePositionsParams.fromJson(Map<String, dynamic> json) =>
      _$ModifyGuildRolePositionsParamsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ModifyGuildRolePositionsParamsToJson(this);
}
