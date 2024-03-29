// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Access to the Audit Logs API
///
/// https://discord.com/developers/docs/resources/audit-log#audit-logs-resource
class AuditLogsApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  AuditLogsApi(this._dio);

  /// Returns an [AuditLog] object for the guild. Requires the 'VIEW_AUDIT_LOG'
  /// permission.
  ///
  /// https://discord.com/developers/docs/resources/audit-log#get-guild-audit-log
  Future<ValidatedResponse<Map<String, dynamic>, AuditLog>> getGuildAuditLog(
    String guildId, {
    /// filter the log for actions made by a user
    String? userId,

    /// the type of [AuditLogEvent]
    AuditLogEvent? actionType,

    /// filter the log before a certain entry id
    String? before,

    /// how many entries are returned (default 50, minimum 1, maximum 100)
    int? limit,
  }) {
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$guildId/audit-logs',
      queryParameters: {
        if (userId != null) 'user_id': userId,
        if (actionType != null) 'action_type': actionType.value,
        if (before != null) 'before': before,
        if (limit != null) 'limit': limit,
      },
    ).validate(transform: AuditLog.fromJson);
  }
}
