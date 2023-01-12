// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Access to the Invites API
///
/// https://discord.com/developers/docs/resources/invite#invite-resource
class InvitesApi {
  static const _basePath = '/invites';

  final Dio _dio;

  /// Constructor
  InvitesApi(this._dio);

  /// Returns an [Invite] object for the given code.
  ///
  /// https://discord.com/developers/docs/resources/invite#get-invite
  Future<ValidatedResponse<Map<String, dynamic>, Invite>> getInvite(
    String inviteCode, {

    /// whether the invite should contain approximate member counts
    bool? withCounts,

    /// whether the invite should contain the expiration date
    bool? withExpiration,

    /// the guild scheduled event to include with the invite
    String? guildScheduledEventId,
  }) {
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$inviteCode',
      queryParameters: {
        if (withCounts != null) 'with_counts': withCounts,
        if (withExpiration != null) 'with_expiration': withExpiration,
        if (guildScheduledEventId != null)
          'guild_scheduled_event_id': guildScheduledEventId,
      },
    ).validate(transform: Invite.fromJson);
  }

  /// Delete an invite. Requires the MANAGE_CHANNELS permission on the channel
  /// this invite belongs to, or MANAGE_GUILD to remove any invite across the
  /// guild. Returns an invite object on success. Fires a Invite Delete Gateway
  /// event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/invite#delete-invite
  Future<ValidatedResponse<Map<String, dynamic>, Invite>> deleteInvite(
    String inviteCode, {
    String? reason,
  }) {
    return _dio
        .delete<Map<String, dynamic>>(
          '$_basePath/$inviteCode',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Invite.fromJson);
  }
}
