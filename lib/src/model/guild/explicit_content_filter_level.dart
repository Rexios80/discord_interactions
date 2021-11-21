// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Explicit Content Filter levels
///
/// https://discord.com/developers/docs/resources/guild#guild-object-explicit-content-filter-level
enum ExplicitContentFilterLevel {
  /// media content will not be scanned
  @JsonValue(0)
  disabled,

  /// media content sent by members without roles will be scanned
  @JsonValue(1)
  membersWithoutRoles,

  /// media content sent by all members will be scanned
  @JsonValue(2)
  allMembers,
}
