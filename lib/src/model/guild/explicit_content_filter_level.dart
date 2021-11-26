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

/// Extension on [ExplicitContentFilterLevel]
extension ExplicitContentFilterLevelExtension on ExplicitContentFilterLevel {
  static const _enumMap = <ExplicitContentFilterLevel, int>{
    ExplicitContentFilterLevel.disabled: 0,
    ExplicitContentFilterLevel.membersWithoutRoles: 1,
    ExplicitContentFilterLevel.allMembers: 2,
  };

  /// Returns the [int] value of the enum
  int get value => _enumMap[this]!;

  /// Returns the enum from the [int] value
  static ExplicitContentFilterLevel fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
