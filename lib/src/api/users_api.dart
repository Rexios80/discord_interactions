// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Users API
///
/// https://discord.com/developers/docs/resources/user
class UsersApi {
  static const _baseUrl = '/users';

  final Dio _dio;

  /// Constructor
  UsersApi(this._dio);

  /// Returns a user object for a given user ID.
  ///
  /// https://discord.com/developers/docs/resources/user#get-user
  Future<DiscordResponse<User>> getUser(String userId) {
    return validateApiCall(
      _dio.get(_baseUrl + '/$userId'),
      responseTransformer: (data) => User.fromJson(data),
    );
  }

  // TODO: Other endpoints
}
