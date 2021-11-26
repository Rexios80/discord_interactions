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
    String channelId, {

    /// 1-100 character channel name
    String? name,
    ThreadMetadata? metadata,

    /// amount of seconds a user has to wait before sending another message
    /// (0-21600)
    int? rateLimitPerUser,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$channelId',
        data: {
          if (name != null) 'name': name,
          if (metadata != null) ...metadata.toJson(),
          if (rateLimitPerUser != null) 'rate_limit_per_user': rateLimitPerUser,
        },
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
    return validateApiCall(
      _dio.get(
        '$_basePath/$channelId/messages',
        queryParameters: {
          if (around != null) 'around': around,
          if (before != null) 'before': before,
          if (after != null) 'after': after,
          if (limit != null) 'limit': limit,
        },
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
      _dio.post(
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
        '$_basePath/$channelId/permissions/${overwrite.id}',
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

  /// Create a new invite object for the channel. Only usable for guild
  /// channels. Requires the CREATE_INSTANT_INVITE permission. All JSON
  /// parameters for this route are optional, however the request body is not.
  /// If you are not sending any fields, you still have to send an empty JSON
  /// object ({}). Returns an invite object. Fires an Invite Create Gateway
  /// event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#create-channel-invite
  Future<DiscordResponse<Invite>> createChannelInvite(
    String channelId, {

    /// duration of invite in seconds before expiry, or 0 for never. between 0
    /// and 604800 (7 days)
    ///
    /// default: 86400 (24 hours)
    int? maxAge,

    /// max number of uses or 0 for unlimited. between 0 and 100
    ///
    /// default: 0
    int? maxUses,

    /// whether this invite only grants temporary membership
    ///
    /// default: false
    bool? temporary,

    /// if true, don't try to reuse a similar invite (useful for creating many
    /// unique one time use invites)
    ///
    /// default: false
    bool? unique,

    /// the type of target for this voice channel invite
    InviteTargetType? targetType,

    /// the id of the user whose stream to display for this invite, required if
    /// target_type is 1, the user must be streaming in the channel
    String? targetUserId,

    /// the id of the embedded application to open for this invite, required if
    /// target_type is 2, the application must have the EMBEDDED flag
    String? targetApplicationId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.post(
        '$_basePath/$channelId/invites',
        data: {
          if (maxAge != null) 'max_age': maxAge,
          if (maxUses != null) 'max_uses': maxUses,
          if (temporary != null) 'temporary': temporary,
          if (unique != null) 'unique': unique,
          if (targetType != null) 'target_type': targetType.value,
          if (targetUserId != null) 'target_user_id': targetUserId,
          if (targetApplicationId != null)
            'target_application_id': targetApplicationId,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Invite.fromJson(data),
    );
  }

  /// Delete a channel permission overwrite for a user or role in a channel.
  /// Only usable for guild channels. Requires the MANAGE_ROLES permission.
  /// Returns a 204 empty response on success. For more information about
  /// permissions, see permissions
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-channel-permission
  Future<DiscordResponse<void>> deleteChannelPermission(
    String channelId, {
    required String overwriteId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId/permissions/$overwriteId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Follow a News Channel to send messages to a target channel. Requires the
  /// MANAGE_WEBHOOKS permission in the target channel. Returns a followed
  /// channel object.
  ///
  /// https://discord.com/developers/docs/resources/channel#follow-news-channel
  Future<DiscordResponse<FollowedChannel>> followNewsChannel(
    String channelId, {

    /// id of target channel
    required String webhookChannelId,
  }) async {
    return validateApiCall(
      _dio.post(
        '$_basePath/$channelId/followers',
        data: {
          'webhook_channel_id': webhookChannelId,
        },
      ),
      responseTransformer: (data) => FollowedChannel.fromJson(data),
    );
  }

  /// Post a typing indicator for the specified channel. Generally bots should
  /// not implement this route. However, if a bot is responding to a command
  /// and expects the computation to take a few seconds, this endpoint may be
  /// called to let the user know that the bot is processing their message.
  /// Returns a 204 empty response on success. Fires a Typing Start Gateway
  /// event.
  ///
  /// https://discord.com/developers/docs/resources/channel#trigger-typing-indicator
  Future<DiscordResponse<void>> triggerTypingIndicator(String channelId) async {
    return validateApiCall(_dio.post('$_basePath/$channelId/typing'));
  }

  /// Returns all pinned messages in the channel as an array of message objects.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-pinned-messages
  Future<DiscordResponse<List<Message>>> getPinnedMessages(
    String channelId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId/pins'),
      responseTransformer: (data) =>
          (data as List).map((message) => Message.fromJson(message)).toList(),
    );
  }

  /// Pin a message in a channel. Requires the MANAGE_MESSAGES permission.
  /// Returns a 204 empty response on success.
  ///
  /// The max pinned messages is 50.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#pin-message
  Future<DiscordResponse<void>> pinMessage(
    String channelId, {
    required String messageId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.put(
        '$_basePath/$channelId/pins/$messageId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Unpin a message in a channel. Requires the MANAGE_MESSAGES permission.
  /// Returns a 204 empty response on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#unpin-message
  Future<DiscordResponse<void>> unpinMessage(
    String channelId, {
    required String messageId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$channelId/pins/$messageId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Adds a recipient to a Group DM using their access token.
  ///
  /// https://discord.com/developers/docs/resources/channel#group-dm-add-recipient
  @Deprecated('Pretty sure this is deprecated')
  Future<DiscordResponse<void>> groupDmAddRecipient(
    String channelId, {
    required String userId,

    /// access token of a user that has granted your app the gdm.join scope
    required String accessToken,

    /// nickname of the user being added
    required String nick,
  }) async {
    return validateApiCall(
      _dio.put(
        '$_basePath/$channelId/recipients/$userId',
        data: {
          'access_token': accessToken,
          'nick': nick,
        },
      ),
    );
  }

  /// Removes a recipient from a Group DM.
  ///
  /// https://discord.com/developers/docs/resources/channel#group-dm-remove-recipient
  @Deprecated('Pretty sure this is deprecated')
  Future<DiscordResponse<void>> groupDmRemoveRecipient(
    String channelId, {
    required String userId,
  }) async {
    return validateApiCall(
      _dio.delete('$_basePath/$channelId/recipients/$userId'),
    );
  }

  /// Creates a new thread from an existing message. Returns a channel on
  /// success, and a 400 BAD REQUEST on invalid parameters. Fires a Thread
  /// Create Gateway event.
  ///
  /// When called on a GUILD_TEXT channel, creates a GUILD_PUBLIC_THREAD. When
  /// called on a GUILD_NEWS channel, creates a GUILD_NEWS_THREAD. The id of the
  /// created thread will be the same as the id of the message, and as such a
  /// message can only have a single thread created from it.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#start-thread-with-message
  Future<DiscordResponse<Channel>> startThreadWithMessage(
    String channelId, {
    required String messageId,

    /// 1-100 character channel name
    required String name,

    /// duration in minutes to automatically archive the thread after recent
    /// activity, can be set to: 60, 1440, 4320, 10080
    ///
    /// The 3 day and 7 day archive durations require the server to be boosted.
    /// The guild features will indicate if a server is able to use those
    /// settings.
    ThreadAutoArchiveDuration? autoArchiveDuration,

    /// amount of seconds a user has to wait before sending another message
    /// (0-21600)
    int? rateLimitPerUser,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.post(
        '$_basePath/$channelId/messages/$messageId/threads',
        data: {
          'name': name,
          if (autoArchiveDuration != null)
            'auto_archive_duration': autoArchiveDuration.value,
          if (rateLimitPerUser != null) 'rate_limit_per_user': rateLimitPerUser,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Creates a new thread that is not connected to an existing message. The
  /// created thread defaults to a GUILD_PRIVATE_THREAD. Returns a channel on
  /// success, and a 400 BAD REQUEST on invalid parameters. Fires a Thread
  /// Create Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#start-thread-without-message
  Future<DiscordResponse<Channel>> startThreadWithoutMessage(
    String channelId, {

    /// 1-100 character channel name
    required String name,

    /// duration in minutes to automatically archive the thread after recent
    /// activity, can be set to: 60, 1440, 4320, 10080
    ///
    /// The 3 day and 7 day archive durations require the server to be boosted.
    /// The guild features will indicate if a server is able to use those
    /// settings.
    ThreadAutoArchiveDuration? autoArchiveDuration,

    /// the type of thread to create
    ///
    /// Creating a private thread requires the server to be boosted. The guild
    /// features will indicate if that is possible for the guild.
    ///
    /// In API v9, type defaults to PRIVATE_THREAD in order to match the
    /// behavior when thread documentation was first published. In API v10 this
    /// will be changed to be a required field, with no default.
    required ChannelType type,

    /// whether non-moderators can add other non-moderators to a thread; only
    /// available when creating a private thread
    bool? invitable,

    /// amount of seconds a user has to wait before sending another message
    /// (0-21600)
    int? rateLimitPerUser,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.post(
        '$_basePath/$channelId/threads',
        data: {
          'name': name,
          if (autoArchiveDuration != null)
            'auto_archive_duration': autoArchiveDuration.value,
          if (rateLimitPerUser != null) 'rate_limit_per_user': rateLimitPerUser,
          'type': type.value,
          if (invitable != null) 'invitable': invitable,
          if (rateLimitPerUser != null) 'rate_limit_per_user': rateLimitPerUser,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Adds the current user to a thread. Also requires the thread is not
  /// archived. Returns a 204 empty response on success. Fires a Thread Members
  /// Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#join-thread
  Future<DiscordResponse<void>> joinThread(String channelId) async {
    return validateApiCall(
      _dio.put('$_basePath/$channelId/thread-members/@me'),
    );
  }

  /// Adds another member to a thread. Requires the ability to send messages in
  /// the thread. Also requires the thread is not archived. Returns a 204 empty
  /// response if the member is successfully added or was already a member of
  /// the thread. Fires a Thread Members Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#add-thread-member
  Future<DiscordResponse<void>> addThreadMember(
    String channelId, {
    required String userId,
  }) async {
    return validateApiCall(
      _dio.put('$_basePath/$channelId/thread-members/$userId'),
    );
  }

  /// Removes the current user from a thread. Also requires the thread is not
  /// archived. Returns a 204 empty response on success. Fires a Thread Members
  /// Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#leave-thread
  Future<DiscordResponse<void>> leaveThread(String channelId) async {
    return validateApiCall(
      _dio.delete('$_basePath/$channelId/thread-members/@me'),
    );
  }

  /// Removes another member from a thread. Requires the MANAGE_THREADS
  /// permission, or the creator of the thread if it is a GUILD_PRIVATE_THREAD.
  /// Also requires the thread is not archived. Returns a 204 empty response on
  /// success. Fires a Thread Members Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#remove-thread-member
  Future<DiscordResponse<void>> removeThreadMember(
    String channelId, {
    required String userId,
  }) async {
    return validateApiCall(
      _dio.delete('$_basePath/$channelId/thread-members/$userId'),
    );
  }

  /// Returns a thread member object for the specified user if they are a
  /// member of the thread, returns a 404 response otherwise.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-thread-member
  Future<DiscordResponse<ThreadMember>> getThreadMember(
    String channelId, {
    required String userId,
  }) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId/thread-members/$userId'),
      responseTransformer: (data) => ThreadMember.fromJson(data),
    );
  }

  /// Returns array of thread members objects that are members of the thread.
  ///
  /// This endpoint is restricted according to whether the GUILD_MEMBERS
  /// Privileged Intent is enabled for your application.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-thread-members
  Future<DiscordResponse<List<ThreadMember>>> listThreadMembers(
    String channelId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId/thread-members'),
      responseTransformer: (data) => (data as List)
          .map<ThreadMember>((e) => ThreadMember.fromJson(e))
          .toList(),
    );
  }

  /// Returns all active threads in the channel, including public and private
  /// threads. Threads are ordered by their id, in descending order.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-active-threads
  @Deprecated(
    'This route is deprecated and will be removed in v10.'
    ' It is replaced by List Active Guild Threads.',
  )
  Future<DiscordResponse<ListThreadsResponse>> listActiveThreads(
    String channelId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$channelId/threads/active'),
      responseTransformer: (data) => ListThreadsResponse.fromJson(data),
    );
  }

  /// Returns archived threads in the channel that are public. When called on a
  /// GUILD_TEXT channel, returns threads of type GUILD_PUBLIC_THREAD. When
  /// called on a GUILD_NEWS channel returns threads of type GUILD_NEWS_THREAD.
  /// Threads are ordered by archive_timestamp, in descending order. Requires
  /// the READ_MESSAGE_HISTORY permission.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-public-archived-threads
  Future<DiscordResponse<ListThreadsResponse>> listPublicArchivedThreads(
    String channelId, {

    /// returns threads before this timestamp
    DateTime? before,

    /// optional maximum number of threads to return
    int? limit,
  }) async {
    return validateApiCall(
      _dio.get(
        '$_basePath/$channelId/threads/archived/public',
        queryParameters: {
          if (before != null) 'before': before.toIso8601String(),
          if (limit != null) 'limit': limit,
        },
      ),
      responseTransformer: (data) => ListThreadsResponse.fromJson(data),
    );
  }

  /// Returns archived threads in the channel that are of type
  /// GUILD_PRIVATE_THREAD. Threads are ordered by archive_timestamp, in
  /// descending order. Requires both the READ_MESSAGE_HISTORY and
  /// MANAGE_THREADS permissions.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-private-archived-threads
  Future<DiscordResponse<ListThreadsResponse>> listPrivateArchivedThreads(
    String channelId, {

    /// returns threads before this timestamp
    DateTime? before,

    /// optional maximum number of threads to return
    int? limit,
  }) async {
    return validateApiCall(
      _dio.get(
        '$_basePath/$channelId/threads/archived/private',
        queryParameters: {
          if (before != null) 'before': before.toIso8601String(),
          if (limit != null) 'limit': limit,
        },
      ),
      responseTransformer: (data) => ListThreadsResponse.fromJson(data),
    );
  }

  /// Returns archived threads in the channel that are of type
  /// GUILD_PRIVATE_THREAD, and the user has joined. Threads are ordered by
  /// their id, in descending order. Requires the READ_MESSAGE_HISTORY
  /// permission.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-joined-private-archived-threads
  Future<DiscordResponse<ListThreadsResponse>> listJoinedPrivateArchivedThreads(
    String channelId, {

    /// returns threads before this id
    String? before,

    /// optional maximum number of threads to return
    int? limit,
  }) async {
    return validateApiCall(
      _dio.get(
        '$_basePath/$channelId/users/@me/threads/archived/private',
        queryParameters: {
          if (before != null) 'before': before,
          if (limit != null) 'limit': limit,
        },
      ),
      responseTransformer: (data) => ListThreadsResponse.fromJson(data),
    );
  }
}
