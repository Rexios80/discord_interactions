import 'package:dio/dio.dart';
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

class UsersApi {
  static const _baseUrl = '/users';

  final Dio _dio;

  /// Constructor
  UsersApi(this._dio);

  /// Returns the [User] object of the requester's account. For OAuth2, this
  /// requires the identify scope, which will return the object without an email,
  /// and optionally the email scope, which returns the object with an email.
  /// 
  /// https://discord.com/developers/docs/resources/user#get-current-user
  Future<DiscordResponse<User>> getCurrentUser() {
    return validateApiCall(
      _dio.get(_baseUrl + '/@me'),
      responseTransformer: (data) => User.fromJson(data),
    );
  }

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
