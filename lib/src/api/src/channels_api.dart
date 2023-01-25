// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/message_flag_converter.dart';
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
  Future<ValidatedResponse<Map<String, dynamic>, Channel>> getChannel(
    String channelId,
  ) async {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$channelId')
        .validate(transform: Channel.fromJson);
  }

  /// Update a group dm's settings. Returns a channel on success, and a 400 BAD
  /// REQUEST on invalid parameters. All JSON parameters are optional.
  ///
  /// https://discord.com/developers/docs/resources/channel#modify-channel
  Future<ValidatedResponse<Map<String, dynamic>, Channel>> modifyGroupDm(
    String channelId, {
    /// 1-100 character channel name
    required String? name,

    /// base64 encoded icon
    required String? iconBase64,
  }) async {
    return _dio.patch<Map<String, dynamic>>(
      '$_basePath/$channelId',
      data: {
        if (name != null) 'name': name,
        if (iconBase64 != null) 'icon': iconBase64,
      },
    ).validate(transform: Channel.fromJson);
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
  Future<ValidatedResponse<Map<String, dynamic>, Channel>> modifyChannel(
    String channelId, {
    /// 1-100 character channel name
    ///
    /// Channel type: All
    String? name,

    /// the type of channel; only conversion between text and news is supported
    /// and only in guilds with the "NEWS" feature
    ///
    /// Channel type: Text, News
    ChannelType? type,

    /// the position of the channel in the left-hand listing
    ///
    /// Channel type: All
    int? position,

    /// 0-1024 character channel topic
    ///
    /// Channel type: Text, News
    String? topic,

    /// whether the channel is nsfw
    ///
    /// Channel type: Text, News, Store
    bool? nsfw,

    /// amount of seconds a user has to wait before sending another message
    /// (0-21600); bots, as well as users with the permission manage_messages
    /// or manage_channel, are unaffected
    ///
    /// Channel type: Text
    int? rateLimitPerUser,

    /// the bitrate (in bits) of the voice channel; 8000 to 96000 (128000 for
    /// VIP servers)
    ///
    /// Channel type: Voice
    int? bitrate,

    /// the user limit of the voice channel; 0 refers to no limit, 1 to 99
    /// refers to a user limit
    ///
    /// Channel type: Voice
    int? userLimit,

    /// channel or category-specific permissions
    ///
    /// Channel type: All
    List<PermissionOverwrite>? permissionOverwrites,

    /// id of the new parent category for a channel
    ///
    /// Channel type: Text, News, Store, Voice
    String? parentId,

    /// channel voice region id, automatic when set to null
    ///
    /// Channel type: Voice
    String? rtcRegion,

    /// the camera video quality mode of the voice channel
    ///
    /// Channel type: Voice
    VideoQualityMode? videoQualityMode,

    /// the default duration that the clients use (not the API) for newly
    /// created threads in the channel, in minutes, to automatically archive
    /// the thread after recent activity
    ///
    /// Channel type: Text, News
    ThreadAutoArchiveDuration? defaultAutoArchiveDuration,
    String? reason,
  }) async {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$channelId',
          data: {
            if (name != null) 'name': name,
            if (type != null) 'type': type.value,
            if (position != null) 'position': position,
            if (topic != null) 'topic': topic,
            if (nsfw != null) 'nsfw': nsfw,
            if (rateLimitPerUser != null)
              'rate_limit_per_user': rateLimitPerUser,
            if (bitrate != null) 'bitrate': bitrate,
            if (userLimit != null) 'user_limit': userLimit,
            if (permissionOverwrites != null)
              'permission_overwrites': permissionOverwrites,
            if (parentId != null) 'parent_id': parentId,
            if (rtcRegion != null) 'rtc_region': rtcRegion,
            if (videoQualityMode != null)
              'video_quality_mode': videoQualityMode.value,
            if (defaultAutoArchiveDuration != null)
              'default_auto_archive_duration': defaultAutoArchiveDuration.value,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Channel.fromJson);
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
  Future<ValidatedResponse<Map<String, dynamic>, Channel>> modifyThread(
    String channelId, {
    /// 1-100 character channel name
    String? name,

    /// whether the thread is archived
    bool? archived,

    /// duration in minutes to automatically archive the thread after recent
    /// activity, can be set to: 60, 1440, 4320, 10080
    ///
    /// The 3 day and 7 day archive durations require the server to be boosted.
    /// The guild features will indicate if a server is able to use those
    /// settings.
    ThreadAutoArchiveDuration? autoArchiveDuration,

    /// whether the thread is locked; when a thread is locked, only users with
    /// MANAGE_THREADS can unarchive it
    bool? locked,

    /// whether non-moderators can add other non-moderators to a thread; only
    /// available on private threads
    bool? invitable,

    /// amount of seconds a user has to wait before sending another message
    /// (0-21600)
    int? rateLimitPerUser,
    String? reason,
  }) async {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$channelId',
          data: {
            if (name != null) 'name': name,
            if (archived != null) 'archived': archived,
            if (autoArchiveDuration != null)
              'auto_archive_duration': autoArchiveDuration.value,
            if (locked != null) 'locked': locked,
            if (invitable != null) 'invitable': invitable,
            if (rateLimitPerUser != null)
              'rate_limit_per_user': rateLimitPerUser,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Channel.fromJson);
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
  Future<ValidatedResponse<void, void>> deleteChannel(
    String channelId, {
    String? reason,
  }) async {
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
  Future<ValidatedResponse<Map<String, dynamic>, List<Message>>>
      getChannelMessages(
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
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$channelId/messages',
      queryParameters: {
        if (around != null) 'around': around,
        if (before != null) 'before': before,
        if (after != null) 'after': after,
        if (limit != null) 'limit': limit,
      },
    ).validate(
      transform: (data) => (data as List)
          .cast<Map<String, dynamic>>()
          .map(Message.fromJson)
          .toList(),
    );
  }

  /// Returns a specific message in the channel. If operating on a guild
  /// channel, this endpoint requires the 'READ_MESSAGE_HISTORY' permission to
  /// be present on the current user. Returns a message object on success.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-channel-message
  Future<ValidatedResponse<Map<String, dynamic>, Message>> getChannelMessage(
    String channelId, {
    required String messageId,
  }) async {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$channelId/messages/$messageId')
        .validate(transform: Message.fromJson);
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
  Future<ValidatedResponse<Map<String, dynamic>, Message>> createMessage(
    String channelId, {
    /// the message contents (up to 2000 characters)
    ///
    /// Required: one of [content], [files], [embeds], [sticker_ids]
    String? content,

    /// true if this is a TTS message
    bool? tts,

    /// embedded rich content (up to 6000 characters)
    ///
    /// Required: one of [content], [files], [embeds], [stickerIds]
    List<Embed>? embeds,

    /// allowed mentions for the message
    AllowedMentions? allowedMentions,

    /// include to make your message a reply
    MessageReference? messageReference,

    /// the components to include with the message
    List<Component>? components,

    /// IDs of up to 3 stickers in the server to send in the message
    ///
    /// Required: one of [content], [files], [embeds], [stickerIds]
    List<String>? stickerIds,

    /// attachment objects with filename and description
    List<Attachment>? attachments,

    /// the contents of the file being sent
    ///
    /// Required: one of [content], [files], [embeds], [stickerIds]
    List<MultipartFile>? files,
  }) {
    return _dio
        .post<Map<String, dynamic>>(
          '$_basePath/$channelId/messages',
          data: createFormData(
            {
              if (content != null) 'content': content,
              if (tts != null) 'tts': tts,
              if (embeds != null) 'embeds': embeds,
              if (allowedMentions != null) 'allowed_mentions': allowedMentions,
              if (messageReference != null)
                'message_reference': messageReference,
              if (components != null) 'components': components,
              if (stickerIds != null) 'sticker_ids': stickerIds,
              if (attachments != null) 'attachments': attachments,
            },
            files,
          ),
        )
        .validate(transform: Message.fromJson);
  }

  /// Crosspost a message in a News Channel to following channels. This endpoint
  /// requires the 'SEND_MESSAGES' permission, if the current user sent the
  /// message, or additionally the 'MANAGE_MESSAGES' permission, for all other
  /// messages, to be present for the current user.
  ///
  /// Returns a [Message] object.
  ///
  /// https://discord.com/developers/docs/resources/channel#crosspost-message
  Future<ValidatedResponse<Map<String, dynamic>, Message>> crosspostMessage(
    String channelId, {
    required String messageId,
  }) async {
    return _dio
        .post<Map<String, dynamic>>(
          '$_basePath/$channelId/messages/$messageId/crosspost',
        )
        .validate(transform: Message.fromJson);
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
  Future<ValidatedResponse<void, void>> createReaction(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return _dio
        .put(
          '$_basePath/$channelId/messages/$messageId/reactions/$emoji/@me',
        )
        .validate();
  }

  /// Delete a reaction the current user has made for the message. Returns a 204
  /// empty response on success. The emoji must be URL Encoded or the request
  /// will fail with 10014: Unknown Emoji. To use custom emoji, you must encode
  /// it in the format name:id with the emoji name and emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-own-reaction
  Future<ValidatedResponse<void, void>> deleteOwnReaction(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return _dio
        .delete(
          '$_basePath/$channelId/messages/$messageId/reactions/$emoji/@me',
        )
        .validate();
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
  Future<ValidatedResponse<void, void>> deleteUserReaction(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
    required String userId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return _dio
        .delete(
          '$_basePath/$channelId/messages/$messageId/reactions/$emoji/$userId',
        )
        .validate();
  }

  /// Get a list of users that reacted with this emoji. Returns an array of user
  /// objects on success. The emoji must be URL Encoded or the request will fail
  /// with 10014: Unknown Emoji. To use custom emoji, you must encode it in the
  /// format name:id with the emoji name and emoji id.
  ///
  /// This method handles emoji encoding for you
  ///
  /// https://discord.com/developers/docs/resources/channel#get-reactions
  Future<ValidatedResponse<Map<String, dynamic>, List<User>>> getReactions(
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
    return _dio
        .get<Map<String, dynamic>>(
          '$_basePath/$channelId/messages/$messageId/reactions/$emoji',
          queryParameters: query,
        )
        .validate(
          transform: (data) => (data as List)
              .cast<Map<String, dynamic>>()
              .map(User.fromJson)
              .toList(),
        );
  }

  /// Deletes all reactions on a message. This endpoint requires the
  /// 'MANAGE_MESSAGES' permission to be present on the current user. Fires a
  /// Message Reaction Remove All Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-all-reactions
  Future<ValidatedResponse<void, void>> deleteAllReactions(
    String channelId, {
    required String messageId,
  }) async {
    return _dio
        .delete('$_basePath/$channelId/messages/$messageId/reactions')
        .validate();
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
  Future<ValidatedResponse<void, void>> deleteAllReactionsForEmoji(
    String channelId, {
    required String messageId,
    required String emojiName,
    required String emojiId,
  }) async {
    final emoji = EmojiEncoder.urlEncode(emojiName, emojiId);
    return _dio
        .delete('$_basePath/$channelId/messages/$messageId/reactions/$emoji')
        .validate();
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
  Future<ValidatedResponse<Map<String, dynamic>, Message>> editMessage(
    String channelId, {
    required String messageId,

    /// the message contents (up to 2000 characters)
    String? content,

    /// embedded rich content (up to 6000 characters)
    List<Embed>? embeds,

    /// edit the flags of a message (only SUPPRESS_EMBEDS can currently be
    /// set/unset)
    List<MessageFlag>? flags,

    /// allowed mentions for the message
    AllowedMentions? allowedMentions,

    /// the components to include with the message
    List<Component>? components,

    /// attached files to keep and possible descriptions for new files
    List<Attachment>? attachments,

    /// the contents of the file being sent/edited
    List<MultipartFile>? files,
  }) async {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$channelId/messages/$messageId',
          data: createFormData(
            {
              if (content != null) 'content': content,
              if (embeds != null) 'embed': embeds,
              if (flags != null) 'flags': MessageFlagConverter().toJson(flags),
              if (allowedMentions != null) 'allowed_mentions': allowedMentions,
              if (components != null) 'components': components,
              if (attachments != null) 'attachments': attachments,
            },
            files,
          ),
        )
        .validate(transform: Message.fromJson);
  }

  /// Delete a message. If operating on a guild channel and trying to delete a
  /// message that was not sent by the current user, this endpoint requires the
  /// MANAGE_MESSAGES permission. Returns a 204 empty response on success. Fires
  /// a Message Delete Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-message
  Future<ValidatedResponse<void, void>> deleteMessage(
    String channelId, {
    required String messageId,
    String? reason,
  }) async {
    return _dio
        .delete(
          '$_basePath/$channelId/messages/$messageId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
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
  Future<ValidatedResponse<void, void>> bulkDeleteMessages(
    String channelId, {
    /// an array of message ids to delete (2-100)
    required List<String> messageIds,
    String? reason,
  }) async {
    return _dio
        .post(
          '$_basePath/$channelId/messages/bulk-delete',
          data: {
            'messages': messageIds,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
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
  Future<ValidatedResponse<void, void>> editChannelPermissions(
    String channelId, {
    required PermissionOverwrite overwrite,
    String? reason,
  }) async {
    return _dio
        .put(
          '$_basePath/$channelId/permissions/${overwrite.id}',
          data: overwrite,
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Returns a list of [Invite] objects (with [InviteMetadata]) for the channel.
  /// Only usable for guild channels. Requires the MANAGE_CHANNELS permission.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-channel-invites
  Future<ValidatedResponse<Map<String, dynamic>, List<Invite>>>
      getChannelInvites(
    String channelId,
  ) async {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$channelId/invites')
        .validate(
          transform: (data) => (data as List)
              .cast<Map<String, dynamic>>()
              .map(Invite.fromJson)
              .toList(),
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
  Future<ValidatedResponse<Map<String, dynamic>, Invite>> createChannelInvite(
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
    return _dio
        .post<Map<String, dynamic>>(
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
        )
        .validate(transform: Invite.fromJson);
  }

  /// Delete a channel permission overwrite for a user or role in a channel.
  /// Only usable for guild channels. Requires the MANAGE_ROLES permission.
  /// Returns a 204 empty response on success. For more information about
  /// permissions, see permissions
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#delete-channel-permission
  Future<ValidatedResponse<void, void>> deleteChannelPermission(
    String channelId, {
    required String overwriteId,
    String? reason,
  }) async {
    return _dio
        .delete(
          '$_basePath/$channelId/permissions/$overwriteId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Follow a News Channel to send messages to a target channel. Requires the
  /// MANAGE_WEBHOOKS permission in the target channel. Returns a followed
  /// channel object.
  ///
  /// https://discord.com/developers/docs/resources/channel#follow-news-channel
  Future<ValidatedResponse<Map<String, dynamic>, FollowedChannel>>
      followNewsChannel(
    String channelId, {
    /// id of target channel
    required String webhookChannelId,
  }) async {
    return _dio.post<Map<String, dynamic>>(
      '$_basePath/$channelId/followers',
      data: {
        'webhook_channel_id': webhookChannelId,
      },
    ).validate(transform: FollowedChannel.fromJson);
  }

  /// Post a typing indicator for the specified channel. Generally bots should
  /// not implement this route. However, if a bot is responding to a command
  /// and expects the computation to take a few seconds, this endpoint may be
  /// called to let the user know that the bot is processing their message.
  /// Returns a 204 empty response on success. Fires a Typing Start Gateway
  /// event.
  ///
  /// https://discord.com/developers/docs/resources/channel#trigger-typing-indicator
  Future<ValidatedResponse<void, void>> triggerTypingIndicator(
    String channelId,
  ) async {
    return _dio.post('$_basePath/$channelId/typing').validate();
  }

  /// Returns all pinned messages in the channel as an array of message objects.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-pinned-messages
  Future<ValidatedResponse<Map<String, dynamic>, List<Message>>>
      getPinnedMessages(
    String channelId,
  ) async {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$channelId/pins')
        .validate(
          transform: (data) => (data as List)
              .cast<Map<String, dynamic>>()
              .map(Message.fromJson)
              .toList(),
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
  Future<ValidatedResponse<void, void>> pinMessage(
    String channelId, {
    required String messageId,
    String? reason,
  }) async {
    return _dio
        .put(
          '$_basePath/$channelId/pins/$messageId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Unpin a message in a channel. Requires the MANAGE_MESSAGES permission.
  /// Returns a 204 empty response on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#unpin-message
  Future<ValidatedResponse<void, void>> unpinMessage(
    String channelId, {
    required String messageId,
    String? reason,
  }) async {
    return _dio
        .delete(
          '$_basePath/$channelId/pins/$messageId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Adds a recipient to a Group DM using their access token.
  ///
  /// https://discord.com/developers/docs/resources/channel#group-dm-add-recipient
  @Deprecated('Pretty sure this is deprecated')
  Future<ValidatedResponse<void, void>> groupDmAddRecipient(
    String channelId, {
    required String userId,

    /// access token of a user that has granted your app the gdm.join scope
    required String accessToken,

    /// nickname of the user being added
    required String nick,
  }) async {
    return _dio.put(
      '$_basePath/$channelId/recipients/$userId',
      data: {
        'access_token': accessToken,
        'nick': nick,
      },
    ).validate();
  }

  /// Removes a recipient from a Group DM.
  ///
  /// https://discord.com/developers/docs/resources/channel#group-dm-remove-recipient
  @Deprecated('Pretty sure this is deprecated')
  Future<ValidatedResponse<void, void>> groupDmRemoveRecipient(
    String channelId, {
    required String userId,
  }) async {
    return _dio.delete('$_basePath/$channelId/recipients/$userId').validate();
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
  Future<ValidatedResponse<Map<String, dynamic>, Channel>>
      startThreadWithMessage(
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
    return _dio
        .post<Map<String, dynamic>>(
          '$_basePath/$channelId/messages/$messageId/threads',
          data: {
            'name': name,
            if (autoArchiveDuration != null)
              'auto_archive_duration': autoArchiveDuration.value,
            if (rateLimitPerUser != null)
              'rate_limit_per_user': rateLimitPerUser,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Channel.fromJson);
  }

  /// Creates a new thread that is not connected to an existing message. The
  /// created thread defaults to a GUILD_PRIVATE_THREAD. Returns a channel on
  /// success, and a 400 BAD REQUEST on invalid parameters. Fires a Thread
  /// Create Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/channel#start-thread-without-message
  Future<ValidatedResponse<Map<String, dynamic>, Channel>>
      startThreadWithoutMessage(
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
    return _dio
        .post<Map<String, dynamic>>(
          '$_basePath/$channelId/threads',
          data: {
            'name': name,
            if (autoArchiveDuration != null)
              'auto_archive_duration': autoArchiveDuration.value,
            if (rateLimitPerUser != null)
              'rate_limit_per_user': rateLimitPerUser,
            'type': type.value,
            if (invitable != null) 'invitable': invitable,
            if (rateLimitPerUser != null)
              'rate_limit_per_user': rateLimitPerUser,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Channel.fromJson);
  }

  /// Adds the current user to a thread. Also requires the thread is not
  /// archived. Returns a 204 empty response on success. Fires a Thread Members
  /// Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#join-thread
  Future<ValidatedResponse<void, void>> joinThread(String channelId) async {
    return _dio.put('$_basePath/$channelId/thread-members/@me').validate();
  }

  /// Adds another member to a thread. Requires the ability to send messages in
  /// the thread. Also requires the thread is not archived. Returns a 204 empty
  /// response if the member is successfully added or was already a member of
  /// the thread. Fires a Thread Members Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#add-thread-member
  Future<ValidatedResponse<void, void>> addThreadMember(
    String channelId, {
    required String userId,
  }) async {
    return _dio.put('$_basePath/$channelId/thread-members/$userId').validate();
  }

  /// Removes the current user from a thread. Also requires the thread is not
  /// archived. Returns a 204 empty response on success. Fires a Thread Members
  /// Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#leave-thread
  Future<ValidatedResponse<void, void>> leaveThread(String channelId) async {
    return _dio.delete('$_basePath/$channelId/thread-members/@me').validate();
  }

  /// Removes another member from a thread. Requires the MANAGE_THREADS
  /// permission, or the creator of the thread if it is a GUILD_PRIVATE_THREAD.
  /// Also requires the thread is not archived. Returns a 204 empty response on
  /// success. Fires a Thread Members Update Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/channel#remove-thread-member
  Future<ValidatedResponse<void, void>> removeThreadMember(
    String channelId, {
    required String userId,
  }) async {
    return _dio
        .delete('$_basePath/$channelId/thread-members/$userId')
        .validate();
  }

  /// Returns a thread member object for the specified user if they are a
  /// member of the thread, returns a 404 response otherwise.
  ///
  /// https://discord.com/developers/docs/resources/channel#get-thread-member
  Future<ValidatedResponse<Map<String, dynamic>, ThreadMember>> getThreadMember(
    String channelId, {
    required String userId,
  }) async {
    return _dio
        .get<Map<String, dynamic>>(
          '$_basePath/$channelId/thread-members/$userId',
        )
        .validate(transform: ThreadMember.fromJson);
  }

  /// Returns array of thread members objects that are members of the thread.
  ///
  /// This endpoint is restricted according to whether the GUILD_MEMBERS
  /// Privileged Intent is enabled for your application.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-thread-members
  Future<ValidatedResponse<Map<String, dynamic>, List<ThreadMember>>>
      listThreadMembers(
    String channelId,
  ) async {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$channelId/thread-members')
        .validate(
          transform: (data) => (data as List)
              .cast<Map<String, dynamic>>()
              .map(ThreadMember.fromJson)
              .toList(),
        );
  }

  /// Returns archived threads in the channel that are public. When called on a
  /// GUILD_TEXT channel, returns threads of type GUILD_PUBLIC_THREAD. When
  /// called on a GUILD_NEWS channel returns threads of type GUILD_NEWS_THREAD.
  /// Threads are ordered by archive_timestamp, in descending order. Requires
  /// the READ_MESSAGE_HISTORY permission.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-public-archived-threads
  Future<ValidatedResponse<Map<String, dynamic>, ListThreadsResponse>>
      listPublicArchivedThreads(
    String channelId, {
    /// returns threads before this timestamp
    DateTime? before,

    /// optional maximum number of threads to return
    int? limit,
  }) async {
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$channelId/threads/archived/public',
      queryParameters: {
        if (before != null) 'before': before.toIso8601String(),
        if (limit != null) 'limit': limit,
      },
    ).validate(transform: ListThreadsResponse.fromJson);
  }

  /// Returns archived threads in the channel that are of type
  /// GUILD_PRIVATE_THREAD. Threads are ordered by archive_timestamp, in
  /// descending order. Requires both the READ_MESSAGE_HISTORY and
  /// MANAGE_THREADS permissions.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-private-archived-threads
  Future<ValidatedResponse<Map<String, dynamic>, ListThreadsResponse>>
      listPrivateArchivedThreads(
    String channelId, {
    /// returns threads before this timestamp
    DateTime? before,

    /// optional maximum number of threads to return
    int? limit,
  }) async {
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$channelId/threads/archived/private',
      queryParameters: {
        if (before != null) 'before': before.toIso8601String(),
        if (limit != null) 'limit': limit,
      },
    ).validate(transform: ListThreadsResponse.fromJson);
  }

  /// Returns archived threads in the channel that are of type
  /// GUILD_PRIVATE_THREAD, and the user has joined. Threads are ordered by
  /// their id, in descending order. Requires the READ_MESSAGE_HISTORY
  /// permission.
  ///
  /// https://discord.com/developers/docs/resources/channel#list-joined-private-archived-threads
  Future<ValidatedResponse<Map<String, dynamic>, ListThreadsResponse>>
      listJoinedPrivateArchivedThreads(
    String channelId, {
    /// returns threads before this id
    String? before,

    /// optional maximum number of threads to return
    int? limit,
  }) async {
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$channelId/users/@me/threads/archived/private',
      queryParameters: {
        if (before != null) 'before': before,
        if (limit != null) 'limit': limit,
      },
    ).validate(transform: ListThreadsResponse.fromJson);
  }
}
