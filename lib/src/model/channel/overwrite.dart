// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'overwrite.g.dart';

/// Overwrite structure
///
/// See permissions for more information about the allow and deny fields.
///
/// https://discord.com/developers/docs/resources/channel#overwrite-object-overwrite-structure
@JsonSerializable()
class Overwrite {
  /// role or user id
  final String id;

  /// either role or member
  final OverwriteType type;

  /// permission bit set
  final String allow;

  /// permission bit set
  final String deny;

  /// Constructor
  Overwrite({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny,
  });

  /// From json
  factory Overwrite.fromJson(Map<String, dynamic> json) =>
      _$OverwriteFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$OverwriteToJson(this);
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
