// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'audit_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditLogEntry _$AuditLogEntryFromJson(Map<String, dynamic> json) =>
    AuditLogEntry(
      targetId: json['target_id'] as String?,
      changes: (json['changes'] as List<dynamic>?)
          ?.map((e) => AuditLogChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['user_id'] as String?,
      id: json['id'] as String,
      actionType: $enumDecode(_$AuditLogEventEnumMap, json['action_type']),
      options: json['options'] == null
          ? null
          : OptionalAuditEntryInfo.fromJson(
              json['options'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$AuditLogEntryToJson(AuditLogEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('target_id', instance.targetId);
  writeNotNull('changes', instance.changes);
  writeNotNull('user_id', instance.userId);
  val['id'] = instance.id;
  val['action_type'] = _$AuditLogEventEnumMap[instance.actionType]!;
  writeNotNull('options', instance.options);
  writeNotNull('reason', instance.reason);
  return val;
}

const _$AuditLogEventEnumMap = {
  AuditLogEvent.guildUpdate: 1,
  AuditLogEvent.channelCreate: 10,
  AuditLogEvent.channelUpdate: 11,
  AuditLogEvent.channelDelete: 12,
  AuditLogEvent.channelOverwriteCreate: 13,
  AuditLogEvent.channelOverwriteUpdate: 14,
  AuditLogEvent.channelOverwriteDelete: 15,
  AuditLogEvent.memberKick: 20,
  AuditLogEvent.memberPrune: 21,
  AuditLogEvent.memberBanAdd: 22,
  AuditLogEvent.memberBanRemove: 23,
  AuditLogEvent.memberUpdate: 24,
  AuditLogEvent.memberRoleUpdate: 25,
  AuditLogEvent.memberMove: 26,
  AuditLogEvent.memberDisconnect: 27,
  AuditLogEvent.botAdd: 28,
  AuditLogEvent.roleCreate: 30,
  AuditLogEvent.roleUpdate: 31,
  AuditLogEvent.roleDelete: 32,
  AuditLogEvent.inviteCreate: 40,
  AuditLogEvent.inviteUpdate: 41,
  AuditLogEvent.inviteDelete: 42,
  AuditLogEvent.webhookCreate: 50,
  AuditLogEvent.webhookUpdate: 51,
  AuditLogEvent.webhookDelete: 52,
  AuditLogEvent.emojiCreate: 60,
  AuditLogEvent.emojiUpdate: 61,
  AuditLogEvent.emojiDelete: 62,
  AuditLogEvent.messageDelete: 72,
  AuditLogEvent.messageBulkDelete: 73,
  AuditLogEvent.messagePin: 74,
  AuditLogEvent.messageUnpin: 75,
  AuditLogEvent.integrationCreate: 80,
  AuditLogEvent.integrationUpdate: 81,
  AuditLogEvent.integrationDelete: 82,
  AuditLogEvent.stageInstanceCreate: 83,
  AuditLogEvent.stageInstanceUpdate: 84,
  AuditLogEvent.stageInstanceDelete: 85,
  AuditLogEvent.stickerCreate: 90,
  AuditLogEvent.stickerUpdate: 91,
  AuditLogEvent.stickerDelete: 92,
  AuditLogEvent.guildScheduledEventCreate: 100,
  AuditLogEvent.guildScheduledEventUpdate: 101,
  AuditLogEvent.guildScheduledEventDelete: 102,
  AuditLogEvent.threadCreate: 110,
  AuditLogEvent.threadUpdate: 111,
  AuditLogEvent.threadDelete: 112,
};
