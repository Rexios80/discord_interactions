// Package imports:
import 'package:dio/dio.dart';

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
  Future<DiscordResponse<void>> createInteractionResponse(
    Interaction interaction, {
    required InteractionResponse response,
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.post(
        '/interactions/${interaction.id}/${interaction.token}/callback',
        data: createFormData(response, files),
      ),
    );
  }

  /// Returns the initial [Message] object created by the Interaction.
  /// Functions the same as Get Webhook Message.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#get-original-interaction-response
  Future<DiscordResponse<Message>> getOriginalInteractionResponse(
    String interactionToken,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/$interactionToken/messages/@original'),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Edits the initial [InteractionResponse]. Functions the same as Edit Webhook Message.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#edit-original-interaction-response
  Future<DiscordResponse<Message>> editOriginalInteractionResponse(
    String interactionToken, {
    required Message message,
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$interactionToken/messages/@original',
        data: createFormData(message, files),
      ),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Deletes the initial Interaction response. Returns 204 on success.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#delete-original-interaction-response
  Future<DiscordResponse<void>> deleteOriginalInteractionResponse(
    String interactionToken,
  ) {
    return validateApiCall(
      _dio.delete('$_basePath/$interactionToken/messages/@original'),
    );
  }

  /// Create a followup message for an [Interaction]. Functions the same as
  /// Execute Webhook, but wait is always true, and flags can be set to 64 in
  /// the body to send an ephemeral message. The thread_id query parameter is
  /// not required (and is furthermore ignored) when using this endpoint for
  /// interaction followups.
  ///
  /// Note that when sending a message, you must provide a value for at least
  /// one of [content], [embeds], or [file].
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#create-followup-message
  Future<DiscordResponse<Message>> createFollowupMessage(
    String interactionToken, {
    required Message message,
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$interactionToken',
        data: createFormData(message, files),
      ),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Returns a followup message for an Interaction. Functions the same as Get
  /// Webhook Message. Does not support ephemeral followups.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#get-followup-message
  Future<DiscordResponse<Message>> getFollowupMessage(
    String interactionToken, {
    required String messageId,
  }) {
    return validateApiCall(
      _dio.get('$_basePath/$interactionToken/messages/$messageId'),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Edits a followup message for an Interaction. Functions the same as Edit
  /// Webhook Message. Does not support ephemeral followups.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#edit-followup-message
  Future<DiscordResponse<Message>> editFollowupMessage(
    String interactionToken, {
    required String messageId,
    required Message message,
    List<MultipartFile>? files,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$interactionToken/messages/$messageId',
        data: createFormData(message, files),
      ),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  /// Deletes a followup message for an Interaction. Returns 204 on success.
  /// Does not support ephemeral followups.
  ///
  /// https://discord.com/developers/docs/interactions/receiving-and-responding#delete-followup-message
  Future<DiscordResponse<void>> deleteFollowupMessage(
    String interactionToken, {
    required String messageId,
  }) {
    return validateApiCall(
      _dio.delete('$_basePath/$interactionToken/messages/$messageId'),
    );
  }
}