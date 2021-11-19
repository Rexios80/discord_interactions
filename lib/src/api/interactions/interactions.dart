// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Interactions API
class Interactions {
  static const _basePath = '/webhooks';

  final Dio _dio;
  final String _path;

  /// Constructor
  Interactions(
    this._dio, {
    required String applicationId,
  }) : _path = '$_basePath/$applicationId';

  /// Create a response to an Interaction from the gateway. Takes an interaction
  /// response. This endpoint also supports file attachments similar to the
  /// webhook endpoints. Refer to Uploading Files for details on uploading
  /// files and multipart/form-data requests.
  Future<DiscordResponse> createInteractionResponse(
    Interaction interaction, {
    required InteractionResponse response,
  }) {
    return validateApiCall(
      _dio.post(
        '/interactions/${interaction.id}/${interaction.token}/callback',
        data: response,
      ),
    );
  }

  // TODO: Other endpoints
}
