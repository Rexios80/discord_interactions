// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'optional_audit_entry_info.g.dart';

/// Optional Audit Entry Info structure
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-entry-object-optional-audit-entry-info
@JsonSerializable()
class OptionalAuditEntryInfo {
  /// channel in which the entities were targeted
  ///
  /// Event: MEMBER_MOVE & MESSAGE_PIN & MESSAGE_UNPIN & MESSAGE_DELETE &
  /// STAGE_INSTANCE_CREATE & STAGE_INSTANCE_UPDATE & STAGE_INSTANCE_DELETE
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// number of entities that were targeted
  ///
  /// Event: MESSAGE_DELETE & MESSAGE_BULK_DELETE & MEMBER_DISCONNECT &
  /// MEMBER_MOVE
  final String? count;

  /// number of days after which inactive members were kicked
  ///
  /// Event: MEMBER_PRUNE
  @JsonKey(name: 'delete_member_days')
  final String? deleteMemberDays;

  /// id of the overwritten entity
  ///
  /// Event: CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE &
  /// CHANNEL_OVERWRITE_DELETE
  final String? id;

  /// number of members removed by the prune
  ///
  /// Event type: MEMBER_PRUNE
  @JsonKey(name: 'members_removed')
  final String? membersRemoved;

  /// id of the message that was targeted
  ///
  /// Event: MESSAGE_PIN & MESSAGE_UNPIN
  @JsonKey(name: 'message_id')
  final String? messageId;

  /// name of the role if type is "0" (not present if type is "1")
  ///
  /// Event: CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE &
  /// CHANNEL_OVERWRITE_DELETE
  @JsonKey(name: 'role_name')
  final String? roleName;

  /// type of overwritten entity - "0" for "role" or "1" for "member"
  ///
  /// Event: CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE &
  /// CHANNEL_OVERWRITE_DELETE
  final String? type;

  /// Constructor
  OptionalAuditEntryInfo({
    this.channelId,
    this.count,
    this.deleteMemberDays,
    this.id,
    this.membersRemoved,
    this.messageId,
    this.roleName,
    this.type,
  });

  /// From json
  factory OptionalAuditEntryInfo.fromJson(Map<String, dynamic> json) =>
      _$OptionalAuditEntryInfoFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$OptionalAuditEntryInfoToJson(this);
}
