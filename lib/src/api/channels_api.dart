// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Channels API
///
/// https://discord.com/developers/docs/resources/channel
class ChannelsApi {
  static const _basePath = '/channels';

  final Dio _dio;

  /// Constructor
  ChannelsApi(this._dio);

  /// Get a channel by ID. Returns a [Channel] object. If the channel is a thread,
  /// a [ThreadMember] object is included in the returned result.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-channel
  Future<DiscordResponse<Channel>> getChannel(String channelId) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId'),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Update a channel's settings. Returns a channel on success, and a 400 BAD
  /// REQUEST on invalid parameters. All JSON parameters are optional.
  ///
  /// Requires the MANAGE_CHANNELS permission for the guild. Fires a Channel
  /// Update Gateway event. If modifying a category, individual Channel Update
  /// events will fire for each child channel that also changes. If modifying
  /// permission overwrites, the MANAGE_ROLES permission is required. Only
  /// permissions your bot has in the guild or channel can be allowed/denied
  /// (unless your bot has a MANAGE_ROLES overwrite in the channel).
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#modify-channel
  Future<DiscordResponse<Channel>> modifyChannel(
    Channel channel, {
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/${channel.id}',
        data: channel,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Update a thread's settings. Returns a channel on success, and a 400 BAD
  /// REQUEST on invalid parameters. All JSON parameters are optional.
  ///
  /// When setting archived to false, when locked is also false, only the
  /// SEND_MESSAGES permission is required.
  ///
  /// Otherwise, requires the MANAGE_THREADS permission. Fires a Thread Update
  /// Gateway event. Requires the thread to have archived set to false or be
  /// set to false in the request.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#modify-channel
  Future<DiscordResponse<Channel>> modifyThread(
    String threadId, {
    required ThreadMetadata metadata,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$threadId',
        data: metadata,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Delete a channel, or close a private message. Requires the MANAGE_CHANNELS
  /// permission for the guild, or MANAGE_THREADS if the channel is a thread.
  /// Deleting a category does not delete its child channels; they will have
  /// their parent_id removed and a Channel Update Gateway event will fire for
  /// each of them. Returns a channel object on success. Fires a Channel Delete
  /// Gateway event (or Thread Delete if the channel was a thread).
  ///
  /// Deleting a guild channel cannot be undone. Use this with caution, as it is
  /// impossible to undo this action when performed on a guild channel. In
  /// contrast, when used with a private message, it is possible to undo the
  /// action by opening a private message with the recipient again.
  ///
  /// For Community guilds, the Rules or Guidelines channel and the Community
  /// Updates channel cannot be deleted.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#deleteclose-channel
  Future<DiscordResponse> deleteChannel(
    String channelId, {
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  // TODO: getChannelMessages

  // TODO: getChannelMessage

  /// Discord may strip certain characters from message content, like invalid
  /// unicode characters or characters which cause unexpected message
  /// formatting. If you are passing user-generated strings into message
  /// content, consider sanitizing the data to prevent unexpected behavior and
  /// utilizing allowed_mentions to prevent unexpected mentions.
  ///
  /// Post a [Message] to a guild text or DM channel. Returns a [Message] object.
  /// Fires a Message Create Gateway event. See message formatting for more
  /// information on how to properly format messages.
  ///
  /// You may create a message as a reply to another message. To do so, include
  /// a message_reference with a message_id. The channel_id and guild_id in the
  /// message_reference are optional, but will be validated if provided.
  ///
  /// Files must be attached using a multipart/form-data body as described in
  /// Uploading Files.
  ///
  /// Limitations
  ///
  /// When operating on a guild channel, the current user must have the
  /// SEND_MESSAGES permission.
  ///
  /// When sending a message with tts (text-to-speech) set to true, the current
  /// user must have the SEND_TTS_MESSAGES permission.
  ///
  /// When creating a message as a reply to another message, the current user
  /// must have the READ_MESSAGE_HISTORY permission.
  ///
  /// The referenced message must exist and cannot be a system message.
  ///
  /// The maximum request size when sending a message is 8MB
  ///
  /// For the embed object, you can set every field except type (it will be rich
  /// regardless of if you try to set it), provider, video, and any height,
  /// width, or proxy_url values for images.
  ///
  /// Note that when sending a message, you must provide a value for at least
  /// one of content, embeds, or files[n].
  ///
  /// https://discord.com/developers/docs/resources/channel#create-message
  Future<DiscordResponse<Message>> createMessage(
    String channelId, {
    required Message message,
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$channelId/messages',
        data: createFormData(message, files),
      ),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  // TODO: Other endpoints
}
