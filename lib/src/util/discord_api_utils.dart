// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

/// Call a Discord API endpoint and validate the response
Future<DiscordResponse<T>> validateApiCall<T>(
  Future<Response> call, {
  T Function(dynamic)? responseTransformer,
}) async {
  final Response response;

  try {
    response = await call;
  } on DioError catch (e, stacktrace) {
    if (e.response != null) {
      return DiscordResponse.error(e.response!.data, stacktrace);
    } else {
      return DiscordResponse.error(e, stacktrace);
    }
  } catch (e, stacktrace) {
    return DiscordResponse.error(e, stacktrace);
  }

  final responseData = response.data;

  try {
    final data = responseTransformer != null
        ? responseTransformer(responseData)
        : responseData;
    return DiscordResponse.success(
      data,
      responseData,
    );
  } catch (e, stacktrace) {
    return DiscordResponse.error(e, stacktrace, raw: responseData);
  }
}

/// Create [FormData] from a [payload] and [files]
FormData createFormData(dynamic payload, List<MultipartFile>? files) {
  final formMap = <String, dynamic>{
    'payload_json': jsonEncode(payload),
  };

  if (files != null) {
    files.forEachIndexed((index, file) {
      formMap['files[$index]'] = file;
    });
  }

  return FormData.fromMap(formMap);
}
