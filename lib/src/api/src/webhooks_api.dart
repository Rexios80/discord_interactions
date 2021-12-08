import 'package:dio/dio.dart';
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Webhooks API
///
/// https://discord.com/developers/docs/resources/webhook
class WebhooksApi {
  static const _basePath = '/webhooks';

  final Dio _dio;

  /// Constructor
  WebhooksApi(this._dio);

  /// Create a new webhook. Requires the MANAGE_WEBHOOKS permission. Returns a
  /// [Webhook] object on success. Webhook names follow our naming restrictions
  /// that can be found in our Usernames and Nicknames documentation, with the
  /// following additional stipulations:
  ///
  /// - Webhook names cannot be: 'clyde'
  ///
  /// https://discord.com/developers/docs/resources/webhook#create-webhook
  Future<DiscordResponse<Webhook>> createWebhook(
    String channelId, {

    /// name of the webhook (1-80 characters)
    required String name,

    /// image for the default webhook avatar
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? avatarImageData,
  }) {
    return validateApiCall(
      _dio.post(
        '/channels/$channelId/webhooks',
        data: {
          'name': name,
          if (avatarImageData != null) 'avatar': avatarImageData,
        },
      ),
      responseTransformer: (data) => Webhook.fromJson(data),
    );
  }

  /// Returns a list of channel [Webhook] objects. Requires the MANAGE_WEBHOOKS
  /// permission.
  ///
  /// https://discord.com/developers/docs/resources/webhook#get-channel-webhooks
  Future<DiscordResponse<List<Webhook>>> getChannelWebhooks(String channelId) {
    return validateApiCall(
      _dio.get('/channels/$channelId/webhooks'),
      responseTransformer: (data) =>
          (data as List).map((e) => Webhook.fromJson(e)).toList(),
    );
  }

  /// Returns a list of guild [Webhook] objects. Requires the MANAGE_WEBHOOKS
  /// permission.
  ///
  /// https://discord.com/developers/docs/resources/webhook#get-guild-webhooks
  Future<DiscordResponse<List<Webhook>>> getGuildWebhooks(String guildId) {
    return validateApiCall(
      _dio.get('/guilds/$guildId/webhooks'),
      responseTransformer: (data) =>
          (data as List).map((e) => Webhook.fromJson(e)).toList(),
    );
  }

  /// Returns the new [Webhook] object for the given id.
  ///
  /// https://discord.com/developers/docs/resources/webhook#get-webhook
  Future<DiscordResponse<Webhook>> getWebhook(String webhookId) {
    return validateApiCall(
      _dio.get('$_basePath/$webhookId'),
      responseTransformer: (data) => Webhook.fromJson(data),
    );
  }

  /// Same as above, except this call does not require authentication and
  /// returns no user in the [Webhook] object.
  ///
  /// https://discord.com/developers/docs/resources/webhook#get-webhook-with-token
  Future<DiscordResponse<Webhook>> getWebhookWithToken(
    String webhookId, {
    required String webhookToken,
  }) {
    return validateApiCall(
      _dio.get('$_basePath/$webhookId/$webhookToken'),
      responseTransformer: (data) => Webhook.fromJson(data),
    );
  }

  /// Modify a webhook. Requires the MANAGE_WEBHOOKS permission. Returns the
  /// updated [Webhook] object on success.
  ///
  /// All parameters to this endpoint are optional
  ///
  /// https://discord.com/developers/docs/resources/webhook#modify-webhook
  Future<DiscordResponse<Webhook>> modifyWebhook(
    String webhookId, {

    /// the default name of the webhook
    String? name,

    /// image for the default webhook avatar
    String? avatarImageData,

    /// the new channel id this webhook should be moved to
    String? channelId,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$webhookId',
        data: {
          if (name != null) 'name': name,
          if (avatarImageData != null) 'avatar': avatarImageData,
          if (channelId != null) 'channel_id': channelId,
        },
      ),
      responseTransformer: (data) => Webhook.fromJson(data),
    );
  }

  /// Same as above, except this call does not require authentication, does not
  /// accept a channel_id parameter in the body, and does not return a user in
  /// the [Webhook] object.
  ///
  /// https://discord.com/developers/docs/resources/webhook#modify-webhook-with-token
  Future<DiscordResponse<Webhook>> modifyWebhookWithToken(
    String webhookId, {
    required String webhookToken,

    /// the default name of the webhook
    String? name,

    /// image for the default webhook avatar
    String? avatarImageData,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$webhookId/$webhookToken',
        data: {
          if (name != null) 'name': name,
          if (avatarImageData != null) 'avatar': avatarImageData,
        },
      ),
      responseTransformer: (data) => Webhook.fromJson(data),
    );
  }

  /// Delete a webhook permanently. Requires the MANAGE_WEBHOOKS permission.
  /// Returns a 204 NO CONTENT response on success.
  ///
  /// https://discord.com/developers/docs/resources/webhook#delete-webhook
  Future<DiscordResponse<void>> deleteWebhook(String webhookId) {
    return validateApiCall(_dio.delete('$_basePath/$webhookId'));
  }

  /// Same as above, except this call does not require authentication.
  ///
  /// https://discord.com/developers/docs/resources/webhook#delete-webhook-with-token
  Future<DiscordResponse<void>> deleteWebhookWithToken(
    String webhookId, {
    required String webhookToken,
  }) {
    return validateApiCall(_dio.delete('$_basePath/$webhookId/$webhookToken'));
  }

  /// Note that when sending a message, you must provide a value for at least
  /// one of [content], [embeds], or [files].
  ///
  /// For the webhook embed objects, you can set every field except [type] (it
  /// will be rich regardless of if you try to set it), [provider], [video], and
  /// any [height], [width], or [proxyUrl] values for images.
  Future<DiscordResponse<Message?>> executeWebhook(
    String webhookId, {
    required String webhookToken,

    /// waits for server confirmation of message send before response, and
    /// returns the created message body (defaults to false; when false a
    /// message that is not saved does not return an error)
    ///
    /// Required: false
    bool? wait,

    /// Send a message to the specified thread within a webhook's channel. The
    /// thread will automatically be unarchived.
    ///
    /// Required: false
    String? threadId,

    /// the message contents (up to 2000 characters)
    ///
    /// Required: one of [content], [files], [embeds]
    String? content,

    /// override the default username of the webhook
    ///
    /// Required: false
    String? username,

    /// override the default avatar of the webhook
    ///
    /// Required: false
    String? avatarUrl,

    /// true if this is a TTS message
    ///
    /// Required: false
    bool? tts,

    /// embedded rich content
    ///
    /// array of up to 10 embed objects
    ///
    /// Required: one of [content], [files], [embeds]
    List<Embed>? embeds,

    /// allowed mentions for the message
    ///
    /// Required: false
    AllowedMentions? allowedMentions,

    /// the components to include with the message
    ///
    /// * Requires an application-owned webhook.
    ///
    /// Required: false
    List<Component>? components,

    /// attachment objects with filename and description
    ///
    /// Required: false
    List<Attachment>? attachments,

    /// the contents of the file being sent
    ///
    /// Required: one of [content], [files], [embeds]
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$webhookId/$webhookToken',
        queryParameters: {
          if (wait != null) 'wait': wait,
          if (threadId != null) 'thread_id': threadId,
        },
        data: createFormData(
          {
            if (content != null) 'content': content,
            if (username != null) 'username': username,
            if (avatarUrl != null) 'avatar_url': avatarUrl,
            if (tts != null) 'tts': tts,
            if (embeds != null) 'embeds': embeds,
            if (allowedMentions != null) 'allowed_mentions': allowedMentions,
            if (components != null) 'components': components,
            if (attachments != null) 'attachments': attachments,
          },
          files,
        ),
      ),
      responseTransformer: (data) =>
          data != null ? Message.fromJson(data) : null,
    );
  }

  /// Refer to Slack's documentation for more information. We do not support
  /// Slack's channel, icon_emoji, mrkdwn, or mrkdwn_in properties.
  ///
  /// https://discord.com/developers/docs/resources/webhook#execute-slackcompatible-webhook
  Future<DiscordResponse<dynamic>> executeSlackCompatibleWebhook(
    String webhookId, {
    required String webhookToken,

    /// waits for server confirmation of message send before response, and
    /// returns the created message body (defaults to false; when false a
    /// message that is not saved does not return an error)
    ///
    /// Required: false
    bool? wait,

    /// Send a message to the specified thread within a webhook's channel. The
    /// thread will automatically be unarchived.
    ///
    /// Required: false
    String? threadId,
    dynamic data,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$webhookId/$webhookToken',
        queryParameters: {
          if (wait != null) 'wait': wait,
          if (threadId != null) 'thread_id': threadId,
        },
        data: data,
      ),
    );
  }

  /// Add a new webhook to your GitHub repo (in the repo's settings), and use
  /// this endpoint as the "Payload URL." You can choose what events your
  /// Discord channel receives by choosing the "Let me select individual
  /// events" option and selecting individual events for the new webhook you're
  /// configuring.
  ///
  /// https://discord.com/developers/docs/resources/webhook#execute-githubcompatible-webhook
  Future<DiscordResponse<dynamic>> executeGitHubCompatibleWebhook(
    String webhookId, {
    required String webhookToken,

    /// waits for server confirmation of message send before response, and
    /// returns the created message body (defaults to false; when false a
    /// message that is not saved does not return an error)
    ///
    /// Required: false
    bool? wait,

    /// Send a message to the specified thread within a webhook's channel. The
    /// thread will automatically be unarchived.
    ///
    /// Required: false
    String? threadId,
    dynamic data,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$webhookId/$webhookToken',
        queryParameters: {
          if (wait != null) 'wait': wait,
          if (threadId != null) 'thread_id': threadId,
        },
        data: data,
      ),
    );
  }

  /// Returns a previously-sent webhook message from the same token. Returns a
  /// [Message] object on success.
  ///
  /// https://discord.com/developers/docs/resources/webhook#get-webhook-message
  Future<DiscordResponse<Message>> getWebhookMessage(
    String webhookId, {
    required String webhookToken,
    required String messageId,

    /// id of the thread the message is in
    ///
    /// Required: false
    String? threadId,
  }) {
    return validateApiCall(
      _dio.get(
        '$_basePath/$webhookId/$webhookToken/messages/$messageId',
        queryParameters: {
          if (threadId != null) 'thread_id': threadId,
        },
      ),
    );
  }

  /// Edits a previously-sent webhook message from the same token. Returns a
  /// [Message] object on success.
  ///
  /// When the [content] field is edited, the mentions array in the [Message]
  /// object will be reconstructed from scratch based on the new content. The
  /// [allowedMentions] field of the edit request controls how this happens. If
  /// there is no explicit [allowedMentions] in the edit request, the [content]
  /// will be parsed with default allowances, that is, without regard to
  /// whether or not an [allowedMentions] was present in the request that
  /// originally created the message.
  ///
  /// Refer to Uploading Files for details on attachments and
  /// multipart/form-data requests. Any provided [files] will be appended to
  /// the message. To remove or replace [files] you will have to supply the
  /// [attachments] field which specifies the files to retain on the message
  /// after edit.
  ///
  /// Starting with API v10, the [attachments] array must contain all
  /// attachments that should be present after edit, including retained and new
  /// [attachments] provided in the request body.
  ///
  /// All parameters to this endpoint are optional and nullable.
  ///
  /// https://discord.com/developers/docs/resources/webhook#edit-webhook-message
  Future<DiscordResponse<Message>> editWebhookMessage(
    String webhookId, {
    required String webhookToken,
    required String messageId,

    /// id of the thread the message is in
    ///
    /// Required: false
    String? threadId,

    /// the message contents (up to 2000 characters)
    String? content,

    /// embedded rich content
    /// 
    /// array of up to 10 embed objects
    List<Embed>? embeds,

    /// allowed mentions for the message
    AllowedMentions? allowedMentions,

    /// the components to include with the message
    /// 
    /// * Requires an application-owned webhook.
    List<Component>? components,

    /// attached files to keep and possible descriptions for new files
    List<Attachment>? attachments,

    /// the contents of the file being sent/edited
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$webhookId/$webhookToken/messages/$messageId',
        queryParameters: {
          if (threadId != null) 'thread_id': threadId,
        },
        data: createFormData(
          {
            if (content != null) 'content': content,
            if (embeds != null) 'embeds': embeds,
            if (allowedMentions != null) 'allowed_mentions': allowedMentions,
            if (components != null) 'components': components,
            if (attachments != null) 'attachments': attachments,
          },
          files,
        ),
      ),
    );
  }

  /// Deletes a message that was created by the webhook. Returns a 204 NO
  /// CONTENT response on success.
  /// 
  /// https://discord.com/developers/docs/resources/webhook#delete-webhook-message
  Future<DiscordResponse<void>> deleteWebhookMessage(
    String webhookId, {
    required String webhookToken,
    required String messageId,

    /// id of the thread the message is in
    ///
    /// Required: false
    String? threadId,
  }) {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$webhookId/$webhookToken/messages/$messageId',
        queryParameters: {
          if (threadId != null) 'thread_id': threadId,
        },
      ),
    );
  }
}
