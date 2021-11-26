/// Convenience class that holds Discord API headers
class DiscordHeader {
  /// Contains the reason an action was performed
  ///
  /// Shown in a guild's audit logs
  static const auditLogReason = 'X-Audit-Log-Reason';

  /// The signature header key
  static const signatureHeaderKey = 'X-Signature-Ed25519';

  /// The signature timestamp header key
  static const timestampHeaderKey = 'X-Signature-Timestamp';
}
