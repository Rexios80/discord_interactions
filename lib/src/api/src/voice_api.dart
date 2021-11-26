// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Voice API
///
/// https://discord.com/developers/docs/resources/voice#voice-resource
class VoiceApi {
  static const _basePath = '/voice';

  final Dio _dio;

  /// Constructor
  VoiceApi(this._dio);

  /// Returns an array of [VoiceRegion] objects that can be used when setting a
  /// voice or stage channel's rtc_region.
  ///
  /// https://discord.com/developers/docs/resources/voice#list-voice-regions
  Future<DiscordResponse<List<VoiceRegion>>> listVoiceRegions() {
    return validateApiCall(
      _dio.get('$_basePath/regions'),
      responseTransformer: (data) =>
          (data as List).map((e) => VoiceRegion.fromJson(e)).toList(),
    );
  }
}
