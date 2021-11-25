// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Stage Instance Privacy levels
///
/// https://discord.com/developers/docs/resources/stage-instance#stage-instance-object-privacy-level
enum PrivacyLevel {
  /// The Stage instance is visible publicly, such as on Stage Discovery.
  @JsonValue(1)
  public,

  /// The Stage instance is visible to only guild members.
  @JsonValue(2)
  guildOnly,
}

/// Extension on [PrivacyLevel]
extension PrivacyLevelExtension on PrivacyLevel {
  static const _enumMap = <PrivacyLevel, int>{
    PrivacyLevel.public: 1,
    PrivacyLevel.guildOnly: 2,
  };

  /// Get the enum value
  int get value => _enumMap[this]!;

  /// Create a [PrivacyLevel] from an [int]
  static PrivacyLevel fromValue(int value) =>
      _enumMap.entries.singleWhere((e) => e.value == value).key;
}
