// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Membership State enum
///
/// https://discord.com/developers/docs/topics/teams#data-models-membership-state-enum
enum MembershipState {
  /// invited
  @JsonValue(1)
  invited,

  /// accepted
  @JsonValue(2)
  accepted,
}
