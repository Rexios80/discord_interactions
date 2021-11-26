// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'audit_log.g.dart';

/// Audit Log structure
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-object-audit-log-structure
@JsonSerializable(includeIfNull: false)
class AuditLog {
  /// list of audit log entries
  @JsonKey(name: 'audit_log_entries')
  final List<AuditLogEntry> auditLogEntries;

  /// list of partial integration objects
  final List<Integration> integrations;

  /// list of threads found in the audit log
  ///
  /// Threads referenced in THREAD_CREATE and THREAD_UPDATE events are included
  /// in the threads map, since archived threads might not be kept in memory by
  /// clients.
  final List<Channel> threads;

  /// list of users found in the audit log
  final List<User> users;

  /// list of webhooks found in the audit log
  final List<Webhook> webhooks;

  /// Constructor
  AuditLog({
    required this.auditLogEntries,
    required this.integrations,
    required this.threads,
    required this.users,
    required this.webhooks,
  });

  /// From json
  factory AuditLog.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$AuditLogToJson(this);
}
