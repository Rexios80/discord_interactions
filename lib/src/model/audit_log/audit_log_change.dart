// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/permission_converter.dart';

/// Audit Log Change structure
///
/// If new_value is not present in the change object, while old_value is, that
/// means the property that was changed has been reset, or set to null
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-change-object-audit-log-change-structure
@JsonSerializable(includeIfNull: false)
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
  factory AuditLogChange.fromJson(Map<String, dynamic> json) {
    final key = AuditLogChangeKeyExtension.fromValue(json['key']);
    final newValue = _parseValue(key, json['new_value']);
    final oldValue = _parseValue(key, json['old_value']);

    return AuditLogChange(
      newValue: newValue,
      oldValue: oldValue,
      key: key,
    );
  }

  static _parseValue(AuditLogChangeKey key, dynamic value) {
    if (value == null) return null;

    switch (key) {
      case AuditLogChangeKey.autoArchiveDuration:
      case AuditLogChangeKey.defaultAutoArchiveDuration:
        return ThreadAutoArchiveDurationExtension.fromValue(value);
      case AuditLogChangeKey.defaultMessageNotifications:
        return DefaultMessageNotificationLevelExtension.fromValue(value);
      case AuditLogChangeKey.formatType:
        return StickerFormatTypeExtension.fromValue(value);
      case AuditLogChangeKey.permissionOverwrites:
        return (value as List)
            .map((e) => PermissionOverwrite.fromJson(e))
            .toList();
      case AuditLogChangeKey.permissions:
        return PermissionConverter().fromJson(value);
      case AuditLogChangeKey.privacyLevel:
        return PrivacyLevelExtension.fromValue(value);
      case AuditLogChangeKey.status:
        return GuildScheduledEventStatusExtension.fromValue(value);
      case AuditLogChangeKey.verificationLevel:
        return VerificationLevelExtension.fromValue(value);
      case AuditLogChangeKey.add:
      case AuditLogChangeKey.remove:
        return (value as List).map((e) => Role.fromJson(e));
      default:
        return value;
    }
  }
}
