// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'audit_log_change.g.dart';

/// Audit Log Change structure
///
/// If new_value is not present in the change object, while old_value is, that
/// means the property that was changed has been reset, or set to null
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-change-object-audit-log-change-structure
///
/// TODO: Convert [newValue] and [oldValue] to proper types based on [key]
@JsonSerializable()
class AuditLogChange {
  /// new value of the key
  @JsonKey(name: 'new_value')
  final dynamic newValue;

  /// old value of the key
  @JsonKey(name: 'old_value')
  final dynamic oldValue;

  /// name of audit log change key
  final AuditLogChangeKey key;

  /// Constructor
  AuditLogChange({
    this.newValue,
    this.oldValue,
    required this.key,
  });

  /// From json
  ///
  /// TODO: Customize this
  factory AuditLogChange.fromJson(Map<String, dynamic> json) =>
      _$AuditLogChangeFromJson(json);

  /// To json
  ///
  /// TODO: Customize this?
  Map<String, dynamic> toJson() => _$AuditLogChangeToJson(this);
}
