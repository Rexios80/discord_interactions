// Package imports:
import 'package:json_annotation/json_annotation.dart';

/// Audit Log events
///
/// https://discord.com/developers/docs/resources/audit-log#audit-log-entry-object-audit-log-events
enum AuditLogEvent {
  /// guild update
  @JsonValue(1)
  guildUpdate,

  /// channel create
  @JsonValue(10)
  channelCreate,

  /// channel update
  @JsonValue(11)
  channelUpdate,

  /// channel delete
  @JsonValue(12)
  channelDelete,

  /// channel overwrite create
  @JsonValue(13)
  channelOverwriteCreate,

  /// channel overwrite update
  @JsonValue(14)
  channelOverwriteUpdate,

  /// channel overwrite delete
  @JsonValue(15)
  channelOverwriteDelete,

  /// member kick
  @JsonValue(20)
  memberKick,

  /// member prune
  @JsonValue(21)
  memberPrune,

  /// member ban add
  @JsonValue(22)
  memberBanAdd,

  /// member ban remove
  @JsonValue(23)
  memberBanRemove,

  /// member update
  @JsonValue(24)
  memberUpdate,

  /// member role update
  @JsonValue(25)
  memberRoleUpdate,

  /// member move
  @JsonValue(26)
  memberMove,

  /// member disconnect
  @JsonValue(27)
  memberDisconnect,

  /// bot add
  @JsonValue(28)
  botAdd,

  /// role create
  @JsonValue(30)
  roleCreate,

  /// role update
  @JsonValue(31)
  roleUpdate,

  /// role delete
  @JsonValue(32)
  roleDelete,

  /// invite create
  @JsonValue(40)
  inviteCreate,

  /// invite update
  @JsonValue(41)
  inviteUpdate,

  /// invite delete
  @JsonValue(42)
  inviteDelete,

  /// webhook create
  @JsonValue(50)
  webhookCreate,

  /// webhook update
  @JsonValue(51)
  webhookUpdate,

  /// webhook delete
  @JsonValue(52)
  webhookDelete,

  /// emoji create
  @JsonValue(60)
  emojiCreate,

  /// emoji update
  @JsonValue(61)
  emojiUpdate,

  /// emoji delete
  @JsonValue(62)
  emojiDelete,

  /// message delete
  @JsonValue(72)
  messageDelete,

  /// message bulk delete
  @JsonValue(73)
  messageBulkDelete,

  /// message pin
  @JsonValue(74)
  messagePin,

  /// message unpin
  @JsonValue(75)
  messageUnpin,

  /// integration create
  @JsonValue(80)
  integrationCreate,

  /// integration update
  @JsonValue(81)
  integrationUpdate,

  /// integration delete
  @JsonValue(82)
  integrationDelete,

  /// stage instance create
  @JsonValue(83)
  stageInstanceCreate,

  /// stage instance update
  @JsonValue(84)
  stageInstanceUpdate,

  /// stage instance delete
  @JsonValue(85)
  stageInstanceDelete,

  /// sticker create
  @JsonValue(90)
  stickerCreate,

  /// sticker update
  @JsonValue(91)
  stickerUpdate,

  /// sticker delete
  @JsonValue(92)
  stickerDelete,

  /// guild scheduled event create
  @JsonValue(100)
  guildScheduledEventCreate,

  /// guild scheduled event update
  @JsonValue(101)
  guildScheduledEventUpdate,

  /// guild scheduled event delete
  @JsonValue(102)
  guildScheduledEventDelete,

  /// thread create
  @JsonValue(110)
  threadCreate,

  /// thread update
  @JsonValue(111)
  threadUpdate,

  /// thread delete
  @JsonValue(112)
  threadDelete,
}

/// Extension on [AuditLogEvent]
extension AuditLogEventExtension on AuditLogEvent {
  /// Get the value of the [AuditLogEvent]
  int get value {
    switch (this) {
      case AuditLogEvent.guildUpdate:
        return 1;
      case AuditLogEvent.channelCreate:
        return 10;
      case AuditLogEvent.channelUpdate:
        return 11;
      case AuditLogEvent.channelDelete:
        return 12;
      case AuditLogEvent.channelOverwriteCreate:
        return 13;
      case AuditLogEvent.channelOverwriteUpdate:
        return 14;
      case AuditLogEvent.channelOverwriteDelete:
        return 15;
      case AuditLogEvent.memberKick:
        return 20;
      case AuditLogEvent.memberPrune:
        return 21;
      case AuditLogEvent.memberBanAdd:
        return 22;
      case AuditLogEvent.memberBanRemove:
        return 23;
      case AuditLogEvent.memberUpdate:
        return 24;
      case AuditLogEvent.memberRoleUpdate:
        return 25;
      case AuditLogEvent.memberMove:
        return 26;
      case AuditLogEvent.memberDisconnect:
        return 27;
      case AuditLogEvent.botAdd:
        return 28;
      case AuditLogEvent.roleCreate:
        return 30;
      case AuditLogEvent.roleUpdate:
        return 31;
      case AuditLogEvent.roleDelete:
        return 32;
      case AuditLogEvent.inviteCreate:
        return 40;
      case AuditLogEvent.inviteUpdate:
        return 41;
      case AuditLogEvent.inviteDelete:
        return 42;
      case AuditLogEvent.webhookCreate:
        return 50;
      case AuditLogEvent.webhookUpdate:
        return 51;
      case AuditLogEvent.webhookDelete:
        return 52;
      case AuditLogEvent.emojiCreate:
        return 60;
      case AuditLogEvent.emojiUpdate:
        return 61;
      case AuditLogEvent.emojiDelete:
        return 62;
      case AuditLogEvent.messageDelete:
        return 72;
      case AuditLogEvent.messageBulkDelete:
        return 73;
      case AuditLogEvent.messagePin:
        return 74;
      case AuditLogEvent.messageUnpin:
        return 75;
      case AuditLogEvent.integrationCreate:
        return 80;
      case AuditLogEvent.integrationUpdate:
        return 81;
      case AuditLogEvent.integrationDelete:
        return 82;
      case AuditLogEvent.stageInstanceCreate:
        return 83;
      case AuditLogEvent.stageInstanceUpdate:
        return 84;
      case AuditLogEvent.stageInstanceDelete:
        return 85;
      case AuditLogEvent.stickerCreate:
        return 90;
      case AuditLogEvent.stickerUpdate:
        return 91;
      case AuditLogEvent.stickerDelete:
        return 92;
      case AuditLogEvent.guildScheduledEventCreate:
        return 100;
      case AuditLogEvent.guildScheduledEventUpdate:
        return 101;
      case AuditLogEvent.guildScheduledEventDelete:
        return 102;
      case AuditLogEvent.threadCreate:
        return 110;
      case AuditLogEvent.threadUpdate:
        return 111;
      case AuditLogEvent.threadDelete:
        return 112;
    }
  }
}
