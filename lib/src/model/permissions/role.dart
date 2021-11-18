// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'role.g.dart';

/// Roles represent a set of permissions attached to a group of users. Roles
/// have unique names, colors, and can be "pinned" to the side bar, causing
/// their members to be listed separately. Roles are unique per guild, and can
/// have separate permission profiles for the global context (guild) and channel
/// context. The @everyone role has the same ID as the guild it belongs to.
@JsonSerializable()
class Role {
  /// role id
  final String id;

  /// role name
  final String name;

  /// integer representation of hexadecimal color code
  final int color;

  /// if this role is pinned in the user listing
  final bool hoist;

  /// role icon hash
  final String? icon;

  /// role unicode emoji
  @JsonKey(name: 'unicode_emoji')
  final String? unicodeEmoji;

  /// position of this role
  final int position;

  /// permission bit set
  final String permissions;

  /// whether this role is managed by an integration
  final bool managed;

  /// whether this role is mentionable
  final bool mentionable;

  /// the tags this role has
  final RoleTags? tags;

  /// Constructor
  Role({
    required this.id,
    required this.name,
    required this.color,
    required this.hoist,
    this.icon,
    this.unicodeEmoji,
    required this.position,
    required this.permissions,
    required this.managed,
    required this.mentionable,
    this.tags,
  });

  /// From json
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
