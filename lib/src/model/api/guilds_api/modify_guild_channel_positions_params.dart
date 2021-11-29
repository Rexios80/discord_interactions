// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'modify_guild_channel_positions_params.g.dart';

/// Modify Guild Channel Positions params
///
/// https://discord.com/developers/docs/resources/guild#modify-guild-channel-positions-json-params
@JsonSerializable(includeIfNull: false)
class ModifyGuildChannelPositionsParams {
  /// channel id
  final String id;

  /// sorting position of the channel
  final int? position;

  /// syncs the permission overwrites with the new parent, if moving to a new category
  @JsonKey(name: 'lock_permissions')
  final bool? lockPermissions;

  /// the new parent ID for the channel that is moved
  @JsonKey(name: 'parent_id')
  final String? parentId;

  /// Constructor
  ModifyGuildChannelPositionsParams({
    required this.id,
    this.position,
    this.lockPermissions,
    this.parentId,
  });

  /// From json
  static ModifyGuildChannelPositionsParams fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ModifyGuildChannelPositionsParamsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() =>
      _$ModifyGuildChannelPositionsParamsToJson(this);
}
