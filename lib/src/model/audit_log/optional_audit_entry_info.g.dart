// GENERATED CODE - DO NOT MODIFY BY HAND

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
      'channel_id': instance.channelId,
      'count': instance.count,
      'delete_member_days': instance.deleteMemberDays,
      'id': instance.id,
      'members_removed': instance.membersRemoved,
      'message_id': instance.messageId,
      'role_name': instance.roleName,
      'type': instance.type,
    };
