// Package imports:
import 'package:dio/dio.dart';
import 'package:dio_response_validator/dio_response_validator.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Interactions API
///
/// Interaction tokens are valid for 15 minutes, meaning you can respond to an
/// interaction within that amount of time.
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding
class InteractionsApi {
  final String _basePath;
  final Dio _dio;

  /// Constructor
  InteractionsApi(
    this._dio, {
    required String applicationId,
  }) : _basePath = '/webhooks/$applicationId';

  /// Create a response to an [Interaction] from the gateway. Takes an
  /// [InteractionResponse]. This endpoint also supports file attachments
  /// similar to the webhook endpoints. Refer to Uploading Files for details on
  /// uploading files and multipart/form-data requests.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#create-interaction-response
  Future<ValidatedResponse<void, void>> createInteractionResponse(
    String interactionId, {
    required String token,
    required InteractionResponse response,
    List<MultipartFile>? files,
  }) {
    return _dio
        .post(
          '/interactions/$interactionId/$token/callback',
          data: createFormData(response, files),
        )
        .validate();
  }

  /// Returns the initial [Message] object created by the Interaction.
  /// Functions the same as Get Webhook Message.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#get-original-interaction-response
  Future<ValidatedResponse<Map<String, dynamic>, Message>>
      getOriginalInteractionResponse(
    String token,
  ) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$token/messages/@original')
        .validate(transform: (data) => Message.fromJson(data));
  }

  /// Edits the initial [InteractionResponse]. Functions the same as Edit
  /// Webhook Message.
  ///
  /// When the [content] field is edited, the mentions array in the message object
  /// will be reconstructed from scratch based on the new content. The
  /// [allowedMentions] field of the edit request controls how this happens. If
  /// there is no explicit [allowedMentions] in the edit request, the content
  /// will be parsed with default allowances, that is, without regard to whether
  /// or not an [allowedMentions] was present in the request that originally
  /// created the message.
  ///
  /// Starting with API v10, the [attachments] array must contain all
  /// attachments that should be present after edit, including retained and new
  /// attachments provided in the request body.
  ///
  /// All parameters to this endpoint are optional and nullable.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#edit-original-interaction-response
  Future<ValidatedResponse<Map<String, dynamic>, Message>>
      editOriginalInteractionResponse(
    String token, {

    /// the message contents (up to 2000 characters)
    String? content,

    /// embedded rich content
    ///
    /// array of up to 10 embed objects
    List<Embed>? embeds,

    /// allowed mentions for the message
    AllowedMentions? allowedMentions,

    /// the components to include with the message
    List<Component>? components,

    /// attached files to keep and possible descriptions for new files
    List<Attachment>? attachments,
    List<MultipartFile>? files,
  }) {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$token/messages/@original',
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
        )
        .validate(transform: (data) => Message.fromJson(data));
  }

  /// Deletes the initial Interaction response. Returns 204 on success.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#delete-original-interaction-response
  Future<ValidatedResponse<void, void>> deleteOriginalInteractionResponse(
    String token,
  ) {
    return _dio.delete('$_basePath/$token/messages/@original').validate();
  }

  /// Create a followup message for an [Interaction]. Functions the same as
  /// Execute Webhook, but wait is always true, and flags can be set to 64 in
  /// the body to send an ephemeral message. The thread_id query parameter is
  /// not required (and is furthermore ignored) when using this endpoint for
  /// interaction followups.
  ///
  /// Note that when sending a message, you must provide a value for at least
  /// one of [content], [embeds], or [files].
  ///
  /// For the webhook embed objects, you can set every field except type (it
  /// will be rich regardless of if you try to set it), provider, video, and
  /// any height, width, or proxy_url values for images.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#create-followup-message
  Future<ValidatedResponse<Map<String, dynamic>, Message>>
      createFollowupMessage(
    String token, {

    /// the message contents (up to 2000 characters)
    String? content,

    /// true if this is a TTS message
    bool? tts,

    /// embedded rich content
    List<Embed>? embeds,

    /// allowed mentions for the message
    AllowedMentions? allowedMentions,

    /// the components to include with the message
    List<Component>? components,

    /// attachment objects with filename and description
    List<Attachment>? attachments,
    List<MultipartFile>? files,
  }) {
    return _dio
        .post<Map<String, dynamic>>(
          '$_basePath/$token',
          data: createFormData(
            {
              if (content != null) 'content': content,
              if (tts != null) 'tts': tts,
              if (embeds != null) 'embeds': embeds,
              if (allowedMentions != null) 'allowed_mentions': allowedMentions,
              if (components != null) 'components': components,
              if (attachments != null) 'attachments': attachments,
            },
            files,
          ),
        )
        .validate(transform: (data) => Message.fromJson(data));
  }

  /// Returns a followup message for an Interaction. Functions the same as Get
  /// Webhook Message. Does not support ephemeral followups.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#get-followup-message
  Future<ValidatedResponse<Map<String, dynamic>, Message>> getFollowupMessage(
    String token, {
    required String messageId,
  }) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$token/messages/$messageId')
        .validate(transform: (data) => Message.fromJson(data));
  }

  /// Edits a followup message for an Interaction. Functions the same as Edit
  /// Webhook Message. Does not support ephemeral followups.
  ///
  /// When the [content] field is edited, the mentions array in the message object
  /// will be reconstructed from scratch based on the new content. The
  /// [allowedMentions] field of the edit request controls how this happens. If
  /// there is no explicit [allowedMentions] in the edit request, the content
  /// will be parsed with default allowances, that is, without regard to whether
  /// or not an [allowedMentions] was present in the request that originally
  /// created the message.
  ///
  /// Starting with API v10, the [attachments] array must contain all
  /// attachments that should be present after edit, including retained and new
  /// attachments provided in the request body.
  ///
  /// All parameters to this endpoint are optional and nullable.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#edit-followup-message
  Future<ValidatedResponse<Map<String, dynamic>, Message>> editFollowupMessage(
    String token, {
    required String messageId,

    /// the message contents (up to 2000 characters)
    String? content,

    /// embedded rich content
    ///
    /// array of up to 10 embed objects
    List<Embed>? embeds,

    /// allowed mentions for the message
    AllowedMentions? allowedMentions,

    /// the components to include with the message
    List<Component>? components,

    /// attached files to keep and possible descriptions for new files
    List<Attachment>? attachments,
    List<MultipartFile>? files,
  }) {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$token/messages/$messageId',
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
        )
        .validate(transform: (data) => Message.fromJson(data));
  }

  /// Deletes a followup message for an Interaction. Returns 204 on success.
  /// Does not support ephemeral followups.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#delete-followup-message
  Future<ValidatedResponse<void, void>> deleteFollowupMessage(
    String token, {
    required String messageId,
  }) {
    return _dio.delete('$_basePath/$token/messages/$messageId').validate();
  }
}
