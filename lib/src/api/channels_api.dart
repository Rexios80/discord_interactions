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
  Future<DiscordResponse<void>> deleteChannel(
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

  /// Returns the messages for a channel. If operating on a guild channel, this
  /// endpoint requires the VIEW_CHANNEL permission to be present on the current
  /// user. If the current user is missing the 'READ_MESSAGE_HISTORY' permission
  /// in the channel then this will return no messages (since they cannot read
  /// the message history). Returns an array of [Message] objects on success.
  ///
  /// The before, after, and around keys are mutually exclusive, only one may
  /// be passed at a time.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-channel-messages
  Future<DiscordResponse<List<Message>>> getChannelMessages(
    String channelId, {

    /// get messages around this message ID
    String? around,

    /// get messages before this message ID
    String? before,

    /// get messages after this message ID
    String? after,

    /// max number of messages to return (1-100)
    ///
    /// Default: 50
    int? limit,
  }) async {
    final queryParameters = <String, dynamic>{
      if (around != null) 'around': around,
      if (before != null) 'before': before,
      if (after != null) 'after': after,
      if (limit != null) 'limit': limit,
    };

    return validateApiCall(
      _dio.get(
        '$_basePath/$channelId/messages',
        queryParameters: queryParameters,
      ),
      responseTransformer: (data) =>
          (data as List).map((message) => Message.fromJson(message)).toList(),
    );
  }

  /// Returns a specific message in the channel. If operating on a guild
  /// channel, this endpoint requires the 'READ_MESSAGE_HISTORY' permission to
  /// be present on the current user. Returns a message object on success.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-channel-message
  Future<DiscordResponse<Message>> getChannelMessage(
    String channelId, {
    required String messageId,
  }) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId/messages/$messageId'),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

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

  /// Crosspost a message in a News Channel to following channels. This endpoint
  /// requires the 'SEND_MESSAGES' permission, if the current user sent the
  /// message, or additionally the 'MANAGE_MESSAGES' permission, for all other
  /// messages, to be present for the current user.
  ///
  /// Returns a [Message] object.
  ///
  /// https://discord.com/developers/docs/resources/channel#crosspost-message
  Future<DiscordResponse<Message>> crosspostMessage(
    String channelId, {
    required String messageId,
  }) async {
    return validateApiCall(
      _dio.post('$_basePath/$channelId/messages/$messageId/crosspost'),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Create a reaction for the message. This endpoint requires the
  /// 'READ_MESSAGE_HISTORY' permission to be present on the current user.
  /// Additionally, if nobody else has reacted to the message using this emoji,
  /// this endpoint requires the 'ADD_REACTIONS' permission to be present on the
  /// current user. Returns a 204 empty response on success. The emoji must be
  /// URL Encoded or the request will fail with 10014: Unknown Emoji. To use
  /// custom emoji, you must encode it in the format name:id with the emoji name
  /// and emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#create-reaction
  Future<DiscordResponse<void>> createReaction(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return validateApiCall(
      _dio.put(
        '$_basePath/$channelId/messages/$messageId/reactions/$emoji/@me',
      ),
    );
  }

  /// Delete a reaction the current user has made for the message. Returns a 204
  /// empty response on success. The emoji must be URL Encoded or the request
  /// will fail with 10014: Unknown Emoji. To use custom emoji, you must encode
  /// it in the format name:id with the emoji name and emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-own-reaction
  Future<DiscordResponse<void>> deleteOwnReaction(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId/messages/$messageId/reactions/$emoji/@me',
      ),
    );
  }

  /// Deletes another user's reaction. This endpoint requires the
  /// 'MANAGE_MESSAGES' permission to be present on the current user. Returns a
  /// 204 empty response on success. The emoji must be URL Encoded or the
  /// request will fail with 10014: Unknown Emoji. To use custom emoji, you must
  /// encode it in the format name:id with the emoji name and emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-user-reaction
  Future<DiscordResponse<void>> deleteUserReaction(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
    required String userId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId/messages/$messageId/reactions/$emoji/$userId',
      ),
    );
  }

  /// Get a list of users that reacted with this emoji. Returns an array of user
  /// objects on success. The emoji must be URL Encoded or the request will fail
  /// with 10014: Unknown Emoji. To use custom emoji, you must encode it in the
  /// format name:id with the emoji name and emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#get-reactions
  Future<DiscordResponse<List<User>>> getReactions(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,

    /// get users after this user ID
    String? after,

    /// max number of users to return (1-100)
    ///
    /// Default: 25
    int? limit,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    final query = {
      if (after != null) 'after': after,
      if (limit != null) 'limit': limit,
    };
    return validateApiCall(
      _dio.get(
        '$_basePath/$channelId/messages/$messageId/reactions/$emoji',
        queryParameters: query,
      ),
      responseTransformer: (data) =>
          (data as List).map((user) => User.fromJson(user)).toList(),
    );
  }

  /// Deletes all reactions on a message. This endpoint requires the
  /// 'MANAGE_MESSAGES' permission to be present on the current user. Fires a
  /// Message Reaction Remove All Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-all-reactions
  Future<DiscordResponse<void>> deleteAllReactions(
    String channelId, {
    required String messageId,
  }) async {
    return validateApiCall(
      _dio.delete('$_basePath/$channelId/messages/$messageId/reactions'),
    );
  }

  /// Deletes all the reactions for a given emoji on a message. This endpoint
  /// requires the MANAGE_MESSAGES permission to be present on the current user.
  /// Fires a Message Reaction Remove Emoji Gateway event. The emoji must be URL
  /// Encoded or the request will fail with 10014: Unknown Emoji. To use custom
  /// emoji, you must encode it in the format name:id with the emoji name and
  /// emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-all-reactions-for-emoji
  Future<DiscordResponse<void>> deleteAllReactionsForEmoji(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return validateApiCall(
      _dio.delete('$_basePath/$channelId/messages/$messageId/reactions/$emoji'),
    );
  }

  /// Edit a previously sent message. The fields content, embeds, and flags can
  /// be edited by the original message author. Other users can only edit flags
  /// and only if they have the MANAGE_MESSAGES permission in the corresponding
  /// channel. When specifying flags, ensure to include all previously set
  /// flags/bits in addition to ones that you are modifying. Only flags
  /// documented in the table below may be modified by users (unsupported flag
  /// changes are currently ignored without error).
  ///
  /// When the content field is edited, the mentions array in the message object
  /// will be reconstructed from scratch based on the new content. The
  /// allowed_mentions field of the edit request controls how this happens. If
  /// there is no explicit allowed_mentions in the edit request, the content
  /// will be parsed with default allowances, that is, without regard to whether
  /// or not an allowed_mentions was present in the request that originally
  /// created the message.
  ///
  /// Returns a [Message] object. Fires a Message Update Gateway event.
  ///
  /// Refer to Uploading Files for details on attachments and
  /// multipart/form-data requests. Any provided files will be appended to the
  /// message. To remove or replace files you will have to supply the
  /// attachments field which specifies the files to retain on the message after
  /// edit.
  ///
  /// Starting with API v10, the attachments array must contain all attachments
  /// that should be present after edit, including retained and new attachments
  /// provided in the request body.
  ///
  /// All parameters to this endpoint are optional and nullable.
  ///
  /// https://discord.com/developers/docs/resources/channel#edit-message
  Future<DiscordResponse<Message>> editMessage(
    String channelId, {
    required String messageId,
    required Message message,
    List<MultipartFile>? files,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$channelId/messages/$messageId',
        data: createFormData(message, files),
      ),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Delete a message. If operating on a guild channel and trying to delete a
  /// message that was not sent by the current user, this endpoint requires the
  /// MANAGE_MESSAGES permission. Returns a 204 empty response on success. Fires
  /// a Message Delete Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-message
  Future<DiscordResponse<void>> deleteMessage(
    String channelId, {
    required String messageId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId/messages/$messageId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Delete multiple messages in a single request. This endpoint can only be
  /// used on guild channels and requires the MANAGE_MESSAGES permission.
  /// Returns a 204 empty response on success. Fires a Message Delete Bulk
  /// Gateway event.
  ///
  /// Any message IDs given that do not exist or are invalid will count towards
  /// the minimum and maximum message count (currently 2 and 100 respectively).
  ///
  /// This endpoint will not delete messages older than 2 weeks, and will fail
  /// with a 400 BAD REQUEST if any message provided is older than that or if
  /// any duplicate message IDs are provided.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#bulk-delete-messages
  Future<DiscordResponse<void>> bulkDeleteMessages(
    String channelId, {

    /// an array of message ids to delete (2-100)
    required List<String> messageIds,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId/messages/bulk-delete',
        data: {
          'messages': messageIds,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Edit the channel permission overwrites for a user or role in a channel.
  /// Only usable for guild channels. Requires the MANAGE_ROLES permission. Only
  /// permissions your bot has in the guild or channel can be allowed/denied
  /// (unless your bot has a MANAGE_ROLES overwrite in the channel). Returns a
  /// 204 empty response on success. For more information about permissions, see
  /// permissions.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#edit-channel-permissions
  Future<DiscordResponse<void>> editChannelPermissions(
    String channelId, {
    required PermissionOverwrite overwrite,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.put(
        '$_basePath/$channelId/permissions/${overwrite.id}}',
        data: overwrite,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Returns a list of [Invite] objects (with [InviteMetadata]) for the channel.
  /// Only usable for guild channels. Requires the MANAGE_CHANNELS permission.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-channel-invites
  Future<DiscordResponse<List<Invite>>> getChannelInvites(
    String channelId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId/invites'),
      responseTransformer: (data) =>
          (data as List).map((invite) => Invite.fromJson(invite)).toList(),
    );
  }

  // TODO: Other endpoints
}
