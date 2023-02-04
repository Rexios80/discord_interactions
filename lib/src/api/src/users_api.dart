// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

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
  Future<ValidatedResponse<Map<String, dynamic>, User>> getCurrentUser() {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/@me')
        .validate(transform: User.fromJson);
  }

  /// Returns a user object for a given user ID.
  ///
  /// https://discord.com/developers/docs/resources/user#get-user
  Future<ValidatedResponse<Map<String, dynamic>, User>> getUser(String userId) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$userId')
        .validate(transform: User.fromJson);
  }

  /// Modify the requester's user account settings. Returns a user object on
  /// success.
  ///
  /// https://discord.com/developers/docs/resources/user#modify-current-user
  Future<ValidatedResponse<Map<String, dynamic>, User>> modifyCurrentUser({
    /// user's username, if changed may cause the user's discriminator to be
    /// randomized.
    String? username,

    /// if passed, modifies the user's avatar
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? avatarImageData,
  }) {
    return _dio.patch<Map<String, dynamic>>(
      '$_basePath/@me',
      data: {
        if (username != null) 'username': username,
        if (avatarImageData != null) 'avatar': avatarImageData,
      },
    ).validate(transform: User.fromJson);
  }

  /// Returns a list of partial guild objects the current user is a member of.
  /// Requires the guilds OAuth2 scope.
  ///
  /// This endpoint returns 200 guilds by default, which is the maximum number
  /// of guilds a non-bot user can join. Therefore, pagination is not needed
  /// for integrations that need to get a list of the users' guilds.
  ///
  /// https://discord.com/developers/docs/resources/user#get-current-user-guilds
  Future<ValidatedResponse<List, List<Guild>>> getCurrentUserGuilds({
    /// get guilds before this guild ID
    String? before,

    /// get guilds after this guild ID
    String? after,

    /// max number of guilds to return (1-200)
    ///
    /// default: 200
    int? limit,
  }) {
    return _dio.get<List>(
      '$_basePath/@me/guilds',
      queryParameters: {
        if (before != null) 'before': before,
        if (after != null) 'after': after,
        if (limit != null) 'limit': limit,
      },
    ).validate(
      transform: (data) =>
          data.cast<Map<String, dynamic>>().map(Guild.fromJson).toList(),
    );
  }

  /// Leave a guild. Returns a 204 empty response on success.
  ///
  /// * It seems like a webhook bot can't do this
  ///
  /// https://discord.com/developers/docs/resources/user#leave-guild
  Future<ValidatedResponse<void, void>> leaveGuild(String guildId) {
    return _dio.delete('$_basePath/@me/guilds/$guildId').validate();
  }

  /// Create a new DM channel with a user. Returns a DM channel object.
  ///
  /// You should not use this endpoint to DM everyone in a server about
  /// something. DMs should generally be initiated by a user action. If you
  /// open a significant amount of DMs too quickly, your bot may be rate limited
  /// or blocked from opening new ones.
  ///
  /// https://discord.com/developers/docs/resources/user#create-dm
  Future<ValidatedResponse<Map<String, dynamic>, Channel>> createDm(
    String userId,
  ) {
    return _dio.post<Map<String, dynamic>>(
      '$_basePath/@me/channels',
      data: {'recipient_id': userId},
    ).validate(transform: Channel.fromJson);
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
  Future<ValidatedResponse<Map<String, dynamic>, dynamic>> createGroupDm() {
    throw UnimplementedError();
  }

  /// Returns a list of connection objects. Requires the connections OAuth2
  /// scope.
  ///
  /// * Pretty sure bots can't have connections
  ///
  /// https://discord.com/developers/docs/resources/user#get-user-connections
  Future<ValidatedResponse> getUserConnections() {
    return _dio.get('$_basePath/@me/connections').validate();
  }
}
