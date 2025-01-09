// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

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
        OptionalAuditEntryInfo instance) =>
    <String, dynamic>{
      if (instance.channelId case final value?) 'channel_id': value,
      if (instance.count case final value?) 'count': value,
      if (instance.deleteMemberDays case final value?)
        'delete_member_days': value,
      if (instance.id case final value?) 'id': value,
      if (instance.membersRemoved case final value?) 'members_removed': value,
      if (instance.messageId case final value?) 'message_id': value,
      if (instance.roleName case final value?) 'role_name': value,
      if (instance.type case final value?) 'type': value,
    };
