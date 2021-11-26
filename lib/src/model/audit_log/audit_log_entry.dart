// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'audit_log_entry.g.dart';

/// Audit Log Entry structure
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-entry-object-audit-log-entry-structure
@JsonSerializable(includeIfNull: false)
class AuditLogEntry {
  /// id of the affected entity (webhook, user, role, etc.)
  @JsonKey(name: 'target_id')
  final String? targetId;

  /// changes made to the target_id
  final List<AuditLogChange>? changes;

  /// the user who made the changes
  @JsonKey(name: 'user_id')
  final String? userId;

  /// id of the entry
  final String id;

  /// type of action that occurred
  @JsonKey(name: 'action_type')
  final AuditLogEvent actionType;

  /// additional info for certain action types
  final OptionalAuditEntryInfo? options;

  /// the reason for the change (0-512 characters)
  final String? reason;

  /// Constructor
  AuditLogEntry({
    this.targetId,
    this.changes,
    this.userId,
    required this.id,
    required this.actionType,
    this.options,
    this.reason,
  });

  /// From json
  factory AuditLogEntry.fromJson(Map<String, dynamic> json) =>
      _$AuditLogEntryFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$AuditLogEntryToJson(this);
}
