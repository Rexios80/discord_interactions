// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/permission_converter.dart';

part 'permission_overwrite.g.dart';

/// Overwrite structure
///
/// See permissions for more information about the allow and deny fields.
///
/// https://discord.com/developers/docs/resources/channel#overwrite-object-overwrite-structure
@JsonSerializable()
class PermissionOverwrite {
  /// role or user id
  final String id;

  /// either role or member
  final OverwriteType type;

  /// permission bit set
  @PermissionConverter()
  final List<Permission> allow;

  /// permission bit set
  @PermissionConverter()
  final List<Permission> deny;

  /// Constructor
  PermissionOverwrite({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny,
  });

  /// From json
  factory PermissionOverwrite.fromJson(Map<String, dynamic> json) =>
      _$PermissionOverwriteFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$PermissionOverwriteToJson(this);
}

/// Overwrite type
enum OverwriteType {
  /// role
  @JsonValue(0)
  role,

  /// member
  @JsonValue(1)
  member,
}
