import 'package:json_annotation/json_annotation.dart';

/// Membership State enum
enum MembershipState {
  /// invited
  @JsonValue(1)
  invited,

  /// accepted
  @JsonValue(2)
  accepted,
}
