// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Users API
///
/// https://discord.com/developers/docs/resources/user
class UsersApi {
  static const _basePath = '/users';

  final Dio _dio;

  /// Constructor
  UsersApi(this._dio);

  /// Returns the user object of the requester's account. For OAuth2, this
  /// requires the identify scope, which will return the object without an
  /// email, and optionally the email scope, which returns the object with an
  /// email.
  ///
  /// https://discord.com/developers/docs/resources/user#get-current-user
  Future<DiscordResponse<User>> getCurrentUser() {
    return validateApiCall(
      _dio.get('$_basePath/@me'),
      responseTransformer: (data) => User.fromJson(data),
    );
  }

  /// Returns a user object for a given user ID.
  ///
  /// https://discord.com/developers/docs/resources/user#get-user
  Future<DiscordResponse<User>> getUser(String userId) {
    return validateApiCall(
      _dio.get('$_basePath/$userId'),
      responseTransformer: (data) => User.fromJson(data),
    );
  }

  /// Modify the requester's user account settings. Returns a user object on
  /// success.
  ///
  /// https://discord.com/developers/docs/resources/user#modify-current-user
  Future<DiscordResponse<User>> modifyCurrentUser({
    /// user's username, if changed may cause the user's discriminator to be
    /// randomized.
    String? username,

    /// if passed, modifies the user's avatar
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? avatarImageData,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/@me',
        data: {
          if (username != null) 'username': username,
          if (avatarImageData != null) 'avatar': avatarImageData,
        },
      ),
      responseTransformer: (data) => User.fromJson(data),
    );
  }

  /// Returns a list of partial guild objects the current user is a member of.
  /// Requires the guilds OAuth2 scope.
  ///
  /// This endpoint returns 200 guilds by default, which is the maximum number
  /// of guilds a non-bot user can join. Therefore, pagination is not needed
  /// for integrations that need to get a list of the users' guilds.
  ///
  /// https://discord.com/developers/docs/resources/user#get-current-user-guilds
  Future<DiscordResponse<List<Guild>>> getCurrentUserGuilds({
    /// get guilds before this guild ID
    String? before,

    /// get guilds after this guild ID
    String? after,

    /// max number of guilds to return (1-200)
    ///
    /// default: 200
    int? limit,
  }) {
    return validateApiCall(
      _dio.get(
        '$_basePath/@me/guilds',
        queryParameters: {
          if (before != null) 'before': before,
          if (after != null) 'after': after,
          if (limit != null) 'limit': limit,
        },
      ),
      responseTransformer: (data) =>
          (data as List).map((guild) => Guild.fromJson(guild)).toList(),
    );
  }

  /// Leave a guild. Returns a 204 empty response on success.
  ///
  /// * It seems like a bot can't do this
  ///
  /// https://discord.com/developers/docs/resources/user#leave-guild
  Future<DiscordResponse<void>> leaveGuild(String guildId) {
    return validateApiCall(_dio.delete('$_basePath/@me/guilds/$guildId'));
  }

  /// Create a new DM channel with a user. Returns a DM channel object.
  ///
  /// You should not use this endpoint to DM everyone in a server about
  /// something. DMs should generally be initiated by a user action. If you
  /// open a significant amount of DMs too quickly, your bot may be rate limited
  /// or blocked from opening new ones.
  ///
  /// https://discord.com/developers/docs/resources/user#create-dm
  Future<DiscordResponse<Channel>> createDm(String userId) {
    return validateApiCall(
      _dio.post('$_basePath/@me/channels', data: {'recipient_id': userId}),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Create a new group DM channel with multiple users. Returns a DM channel
  /// object. This endpoint was intended to be used with the now-deprecated
  /// GameBridge SDK. DMs created with this endpoint will not be shown in the
  /// Discord client
  ///
  /// https://discord.com/developers/docs/resources/user#create-group-dm
  @Deprecated(
    'This endpoint was intended to be used with the now-deprecated GameBridge'
    ' SDK. DMs created with this endpoint will not be shown in the Discord'
    ' client',
  )
  Future<DiscordResponse<dynamic>> createGroupDm() {
    throw UnimplementedError();
  }

  /// Returns a list of connection objects. Requires the connections OAuth2
  /// scope.
  ///
  /// * Pretty sure bots can't have connections
  ///
  /// https://discord.com/developers/docs/resources/user#get-user-connections
  Future<DiscordResponse<dynamic>> getUserConnections() {
    return validateApiCall(
      _dio.get('$_basePath/@me/connections'),
      responseTransformer: (data) => data,
    );
  }
}
