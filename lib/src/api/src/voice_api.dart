// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

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
  Future<ValidatedResponse<List, List<VoiceRegion>>> listVoiceRegions() {
    return _dio.get<List>('$_basePath/regions').validate(
          transform: (data) => data
              .cast<Map<String, dynamic>>()
              .map(VoiceRegion.fromJson)
              .toList(),
        );
  }
}
