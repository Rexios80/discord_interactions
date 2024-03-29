// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Access to the Stage Instances API
///
/// https://discord.com/developers/docs/resources/stage-instance#stage-instance-resource
class StageInstancesApi {
  static const _basePath = '/stage-instances';

  final Dio _dio;

  /// Constructor
  StageInstancesApi(this._dio);

  /// Creates a new Stage instance associated to a Stage channel.
  ///
  /// Requires the user to be a moderator of the Stage channel.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/stage-instance#create-stage-instance
  Future<ValidatedResponse<Map<String, dynamic>, StageInstance>>
      createStageInstance(
    /// The id of the Stage channel
    String channelId, {
    /// The topic of the Stage instance (1-120 characters)
    required String topic,

    /// The privacy level of the Stage instance (default GUILD_ONLY)
    PrivacyLevel? privacyLevel,
    String? reason,
  }) {
    return _dio
        .post<Map<String, dynamic>>(
          _basePath,
          data: {
            'channel_id': channelId,
            'topic': topic,
            if (privacyLevel != null) 'privacy_level': privacyLevel.value,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: StageInstance.fromJson);
  }

  /// Gets the stage instance associated with the Stage channel, if it exists.
  ///
  /// https://discord.com/developers/docs/resources/stage-instance#get-stage-instance
  Future<ValidatedResponse<Map<String, dynamic>, StageInstance>>
      getStageInstance(
    String channelId,
  ) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$channelId')
        .validate(transform: StageInstance.fromJson);
  }

  /// Updates fields of an existing Stage instance.
  ///
  /// Requires the user to be a moderator of the Stage channel.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/stage-instance#modify-stage-instance
  Future<ValidatedResponse<Map<String, dynamic>, StageInstance>>
      modifyStageInstance(
    String channelId, {
    /// The topic of the Stage instance (1-120 characters)
    String? topic,

    /// The privacy level of the Stage instance
    PrivacyLevel? privacyLevel,
    String? reason,
  }) {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$channelId',
          data: {
            if (topic != null) 'topic': topic,
            if (privacyLevel != null) 'privacy_level': privacyLevel.value,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: StageInstance.fromJson);
  }

  /// Deletes the Stage instance.
  ///
  /// Requires the user to be a moderator of the Stage channel.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/stage-instance#delete-stage-instance
  Future<ValidatedResponse<void, void>> deleteStageInstance(
    String channelId, {
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$channelId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }
}
