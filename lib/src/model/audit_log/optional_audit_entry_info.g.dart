// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'optional_audit_entry_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionalAuditEntryInfo _$OptionalAuditEntryInfoFromJson(
        Map<String, dynamic> json) =>
    OptionalAuditEntryInfo(
      channelId: json['channel_id'] as String?,
      count: json['count'] as String?,
      deleteMemberDays: json['delete_member_days'] as String?,
      id: json['id'] as String?,
      membersRemoved: json['members_removed'] as String?,
      messageId: json['message_id'] as String?,
      roleName: json['role_name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$OptionalAuditEntryInfoToJson(
    OptionalAuditEntryInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channel_id', instance.channelId);
  writeNotNull('count', instance.count);
  writeNotNull('delete_member_days', instance.deleteMemberDays);
  writeNotNull('id', instance.id);
  writeNotNull('members_removed', instance.membersRemoved);
  writeNotNull('message_id', instance.messageId);
  writeNotNull('role_name', instance.roleName);
  writeNotNull('type', instance.type);
  return val;
}
