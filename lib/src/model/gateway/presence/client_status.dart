// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'client_status.g.dart';

/// Client Status structure
///
/// Active sessions are indicated with an "online", "idle", or "dnd" string per
/// platform. If a user is offline or invisible, the corresponding field is not
/// present.
///
/// https://discord.com/developers/docs/topics/gateway#client-status-object
@JsonSerializable()
class ClientStatus {
  /// the user's status set for an active desktop (Windows, Linux, Mac) application session
  final PresenceStatus? desktop;

  /// the user's status set for an active mobile (iOS, Android) application session
  final PresenceStatus? mobile;

  /// the user's status set for an active web (browser, bot account) application session
  final PresenceStatus? web;

  /// Constructor
  ClientStatus({
    this.desktop,
    this.mobile,
    this.web,
  });

  /// From json
  factory ClientStatus.fromJson(Map<String, dynamic> json) =>
      _$ClientStatusFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ClientStatusToJson(this);
}
