// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

/// Call a Discord API endpoint and validate the response
Future<DiscordResponse<T>> validateApiCall<T>(
  Future<Response> call, {
  T Function(dynamic)? responseTransformer,
}) async {
  try {
    final response = await call;
    return DiscordResponse.success(
      responseTransformer != null ? responseTransformer(response.data) : null,
    );
  } on DioError catch (e) {
    if (e.response != null) {
      return DiscordResponse.error(e.response!.data);
    } else {
      return DiscordResponse.error(e);
    }
  } catch (e) {
    return DiscordResponse.error(e);
  }
}
