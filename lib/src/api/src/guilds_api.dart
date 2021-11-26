// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/permission_converter.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Guilds API
///
/// https://discord.com/developers/docs/resources/guild#guild-resource
class GuildsApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  GuildsApi(this._dio);

  /// Create a new guild. Returns a guild object on success. Fires a Guild
  /// Create Gateway event.
  ///
  /// This endpoint can be used only by bots in less than 10 guilds.
  ///
  /// When using the roles parameter, the first member of the array is used to
  /// change properties of the guild's @everyone role. If you are trying to
  /// bootstrap a guild with additional roles, keep this in mind.
  ///
  /// When using the roles parameter, the required id field within each role
  /// object is an integer placeholder, and will be replaced by the API upon
  /// consumption. Its purpose is to allow you to overwrite a role's permissions
  /// in a channel when also passing in channels with the channels array.
  ///
  /// When using the channels parameter, the position field is ignored, and none
  /// of the default channels are created.
  ///
  /// When using the channels parameter, the id field within each channel object
  /// may be set to an integer placeholder, and will be replaced by the API upon
  /// consumption. Its purpose is to allow you to create GUILD_CATEGORY channels
  /// by setting the parent_id field on any children to the category's id field.
  /// Category channels must be listed before any children.
  ///
  /// https://discord.com/developers/docs/resources/guild#create-guild
  Future<DiscordResponse<Guild>> createGuild(Guild guild) async {
    return validateApiCall(
      _dio.post(_basePath, data: guild),
      responseTransformer: (data) => Guild.fromJson(data),
    );
  }

  /// Returns the guild object for the given id. If with_counts is set to true,
  /// this endpoint will also return approximate_member_count and
  /// approximate_presence_count for the guild.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild
  Future<DiscordResponse<Guild>> getGuild(
    String guildId, {

    /// when true, will return approximate member and presence counts for the
    /// guild
    bool? withCounts,
  }) async {
    return validateApiCall(
      _dio.get(
        '$_basePath/$guildId',
        queryParameters: {
          if (withCounts != null) 'with_counts': withCounts,
        },
      ),
      responseTransformer: (data) => Guild.fromJson(data),
    );
  }

  /// Returns the guild preview object for the given id. If the user is not in
  /// the guild, then the guild must be lurkable (it must be Discoverable or
  /// have a live public stage).
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-preview
  Future<DiscordResponse<GuildPreview>> getGuildPreview(String guildId) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/preview'),
      responseTransformer: (data) => GuildPreview.fromJson(data),
    );
  }

  /// Modify a guild's settings. Requires the MANAGE_GUILD permission. Returns
  /// the updated guild object on success. Fires a Guild Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild
  Future<DiscordResponse<Guild>> modifyGuild(
    String guildId, {
    required Guild guild,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId',
        data: guild,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Guild.fromJson(data),
    );
  }

  /// Delete a guild permanently. User must be owner. Returns 204 No Content on
  /// success. Fires a Guild Delete Gateway event.
  ///
  /// https://discord.com/developers/docs/resources/guild#delete-guild
  Future<DiscordResponse<void>> deleteGuild(String guildId) async {
    return validateApiCall(_dio.delete('$_basePath/$guildId'));
  }

  /// Returns a list of guild channel objects. Does not include threads.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-channels
  Future<DiscordResponse<List<Channel>>> getGuildChannels(
    String guildId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/channels'),
      responseTransformer: (data) =>
          (data as List).map((e) => Channel.fromJson(e)).toList(),
    );
  }

  /// Create a new channel object for the guild. Requires the MANAGE_CHANNELS
  /// permission. If setting permission overwrites, only permissions your bot
  /// has in the guild can be allowed/denied. Setting MANAGE_ROLES permission
  /// in channels is only possible for guild administrators. Returns the new
  /// channel object on success. Fires a Channel Create Gateway event.
  ///
  /// All parameters to this endpoint are optional excluding 'name'
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#create-guild-channel
  Future<DiscordResponse<Channel>> createGuildChannel(
    String guildId, {
    required Channel channel,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.post(
        '$_basePath/$guildId/channels',
        data: channel,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Channel.fromJson(data),
    );
  }

  /// Modify the positions of a set of channel objects for the guild. Requires
  /// MANAGE_CHANNELS permission. Returns a 204 empty response on success. Fires
  /// multiple Channel Update Gateway events.
  ///
  /// Only channels to be modified are required.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-channel-positions
  Future<DiscordResponse<void>> modifyGuildChannelPositions(
    String guildId, {
    required List<ModifyGuildChannelPositionsParams> params,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/channels',
        data: params,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Returns all active threads in the guild, including public and private
  /// threads. Threads are ordered by their id, in descending order.
  ///
  /// https://discord.com/developers/docs/resources/guild#list-active-threads
  Future<DiscordResponse<ListThreadsResponse>> listActiveThreads(
    String guildId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/threads/active'),
      responseTransformer: (data) => ListThreadsResponse.fromJson(data),
    );
  }

  /// Returns a [GuildMember] object for the specified user.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-member
  Future<DiscordResponse<GuildMember>> getGuildMember(
    String guildId, {
    required String userId,
  }) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/members/$userId'),
      responseTransformer: (data) => GuildMember.fromJson(data),
    );
  }

  /// Returns a list of guild member objects that are members of the guild.
  ///
  /// This endpoint is restricted according to whether the GUILD_MEMBERS
  /// Privileged Intent is enabled for your application.
  ///
  /// https://discord.com/developers/docs/resources/guild#list-guild-members
  Future<DiscordResponse<List<GuildMember>>> listGuildMembers(
    String guildId, {

    /// max number of members to return (1-1000)
    ///
    /// default: 1
    int? limit,

    /// the highest user id in the previous page
    ///
    /// default: 0
    String? after,
  }) async {
    return validateApiCall(
      _dio.get(
        '$_basePath/$guildId/members',
        queryParameters: {
          if (limit != null) 'limit': limit,
          if (after != null) 'after': after,
        },
      ),
      responseTransformer: (data) =>
          (data as List).map((e) => GuildMember.fromJson(e)).toList(),
    );
  }

  /// Returns a list of guild member objects whose username or nickname starts
  /// with a provided string.
  ///
  /// https://discord.com/developers/docs/resources/guild#search-guild-members
  Future<DiscordResponse<List<GuildMember>>> searchGuildMembers(
    String guildId, {

    /// Query string to match username(s) and nickname(s) against.
    required String query,

    /// max number of members to return (1-1000)
    ///
    /// default: 1
    int? limit,
  }) async {
    return validateApiCall(
      _dio.get(
        '$_basePath/$guildId/members/search',
        queryParameters: {
          'query': query,
          if (limit != null) 'limit': limit,
        },
      ),
      responseTransformer: (data) =>
          (data as List).map((e) => GuildMember.fromJson(e)).toList(),
    );
  }

  /// Adds a user to the guild, provided you have a valid oauth2 access token
  /// for the user with the guilds.join scope. Returns a 201 Created with the
  /// guild member as the body, or 204 No Content if the user is already a
  /// member of the guild. Fires a Guild Member Add Gateway event.
  ///
  /// For guilds with Membership Screening enabled, this endpoint will default
  /// to adding new members as pending in the guild member object. Members that
  /// are pending will have to complete membership screening before they become
  /// full members that can talk.
  ///
  /// The Authorization header must be a Bot token (belonging to the same
  /// application used for authorization), and the bot must be a member of the
  /// guild with CREATE_INSTANT_INVITE permission.
  ///
  /// For guilds with Membership Screening enabled, assigning a role using the
  /// roles parameter will add the user to the guild as a full member (pending
  /// is false in the member object). A member with a role will bypass
  /// membership screening and the guild's verification level, and get
  /// immediate access to chat. Therefore, instead of assigning a role when the
  /// member joins, it is recommended to grant roles only after the user
  /// completes screening.
  ///
  /// https://discord.com/developers/docs/resources/guild#add-guild-member
  Future<DiscordResponse<GuildMember?>> addGuildMember(
    String guildId, {
    required String userId,

    /// an oauth2 access token granted with the guilds.join to the bot's
    /// application for the user you want to add to the guild
    required String accessToken,

    /// value to set users nickname to
    ///
    /// Permission: MANAGE_NICKNAMES
    String? nick,

    /// array of role ids the member is assigned
    ///
    /// Permission: MANAGE_ROLES
    List<String>? roleIds,

    /// whether the user is muted in voice channels
    ///
    /// Permission: MUTE_MEMBERS
    bool? mute,

    /// whether the user is deafened in voice channels
    ///
    /// Permission: DEAFEN_MEMBERS
    bool? deaf,
  }) async {
    return validateApiCall(
      _dio.put(
        '$_basePath/$guildId/members/$userId',
        data: {
          'access_token': accessToken,
          if (nick != null) 'nick': nick,
          if (roleIds != null) 'roles': roleIds,
          if (mute != null) 'mute': mute,
          if (deaf != null) 'deaf': deaf,
        },
      ),
      responseTransformer: (data) =>
          data != null ? GuildMember.fromJson(data) : null,
    );
  }

  /// Modify attributes of a guild member. Returns a 200 OK with the guild
  /// member as the body. Fires a Guild Member Update Gateway event. If the
  /// channel_id is set to null, this will force the target user to be
  /// disconnected from voice.
  ///
  /// All parameters to this endpoint are optional and nullable. When moving
  /// members to channels, the API user must have permissions to both connect
  /// to the channel and have the MOVE_MEMBERS permission.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-member
  Future<DiscordResponse<GuildMember>> modifyGuildMember(
    String guildId, {
    required String userId,

    /// value to set users nickname to
    ///
    /// Permission: MANAGE_NICKNAMES
    String? nick,

    /// array of role ids the member is assigned
    ///
    /// Permission: MANAGE_ROLES
    List<String>? roleIds,

    /// whether the user is muted in voice channels. Will throw a 400 if the
    /// user is not in a voice channel
    ///
    /// Permission: MUTE_MEMBERS
    bool? mute,

    /// whether the user is deafened in voice channels. Will throw a 400 if the
    /// user is not in a voice channel
    ///
    /// Permission: DEAFEN_MEMBERS
    bool? deaf,

    /// id of channel to move user to (if they are connected to voice)
    ///
    /// Permission: MOVE_MEMBERS
    String? channelId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/members/$userId',
        data: {
          if (nick != null) 'nick': nick,
          if (roleIds != null) 'roles': roleIds,
          if (mute != null) 'mute': mute,
          if (deaf != null) 'deaf': deaf,
          if (channelId != null) 'channel_id': channelId,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => GuildMember.fromJson(data),
    );
  }

  /// Modifies the current member in a guild. Returns a 200 with the updated
  /// member object on success. Fires a Guild Member Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-current-member
  Future<DiscordResponse<GuildMember>> modifyCurrentMember(
    String guildId, {
    String? nick,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/members/@me',
        data: {
          'nick': nick,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => GuildMember.fromJson(data),
    );
  }

  /// Adds a role to a guild member. Requires the MANAGE_ROLES permission.
  /// Returns a 204 empty response on success. Fires a Guild Member Update
  /// Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#add-guild-member-role
  Future<DiscordResponse<void>> addGuildMemberRole(
    String guildId, {
    required String userId,
    required String roleId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.put(
        '$_basePath/$guildId/members/$userId/roles/$roleId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Removes a role from a guild member. Requires the MANAGE_ROLES permission.
  /// Returns a 204 empty response on success. Fires a Guild Member Update
  /// Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#remove-guild-member-role
  Future<DiscordResponse<void>> removeGuildMemberRole(
    String guildId, {
    required String userId,
    required String roleId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$guildId/members/$userId/roles/$roleId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Remove a member from a guild. Requires KICK_MEMBERS permission. Returns a
  /// 204 empty response on success. Fires a Guild Member Remove Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#remove-guild-member
  Future<DiscordResponse<void>> removeGuildMember(
    String guildId, {
    required String userId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$guildId/members/$userId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Returns a list of ban objects for the users banned from this guild.
  /// Requires the BAN_MEMBERS permission.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-bans
  Future<DiscordResponse<List<Ban>>> getGuildBans(String guildId) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/bans'),
      responseTransformer: (data) =>
          (data as List).map((ban) => Ban.fromJson(ban)).toList(),
    );
  }

  /// Returns a ban object for the given user or a 404 not found if the ban
  /// cannot be found. Requires the BAN_MEMBERS permission.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-ban
  Future<DiscordResponse<Ban>> getGuildBan(
    String guildId, {
    required String userId,
  }) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/bans/$userId'),
      responseTransformer: (data) => Ban.fromJson(data),
    );
  }

  /// Create a guild ban, and optionally delete previous messages sent by the
  /// banned user. Requires the BAN_MEMBERS permission. Returns a 204 empty
  /// response on success. Fires a Guild Ban Add Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#create-guild-ban
  Future<DiscordResponse<void>> createGuildBan(
    String guildId, {
    required String userId,

    /// number of days to delete messages for (0-7)
    int? deleteMessageDays,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.put(
        '$_basePath/$guildId/bans/$userId',
        data: {
          'delete_message_days': deleteMessageDays,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Remove the ban for a user. Requires the BAN_MEMBERS permissions. Returns
  /// a 204 empty response on success. Fires a Guild Ban Remove Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#remove-guild-ban
  Future<DiscordResponse<void>> removeGuildBan(
    String guildId, {
    required String userId,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$guildId/bans/$userId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }

  /// Returns a list of [Role] objects for the guild.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-roles
  Future<DiscordResponse<List<Role>>> getGuildRoles(String guildId) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/roles'),
      responseTransformer: (data) =>
          (data as List).map((role) => Role.fromJson(role)).toList(),
    );
  }

  /// Create a new role for the guild. Requires the MANAGE_ROLES permission.
  /// Returns the new role object on success. Fires a Guild Role Create Gateway
  /// event. All JSON params are optional.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#create-guild-role
  Future<DiscordResponse<Role>> createGuildRole(
    String guildId, {

    /// name of the role
    ///
    /// default: "new role"
    String? name,

    /// bitwise value of the enabled/disabled permissions
    ///
    /// default: @everyone permissions in guild
    List<Permission>? permissions,

    /// RGB color value
    ///
    /// default: 0
    int? color,

    /// whether the role should be displayed separately in the sidebar
    ///
    /// default: false
    bool? hoist,

    /// the role's icon image (if the guild has the ROLE_ICONS feature)
    ///
    /// Use [ImageData.fromBase64] to create this string
    ///
    /// default: null
    String? iconImageData,

    /// the role's unicode emoji as a standard emoji (if the guild has the
    /// ROLE_ICONS feature)
    ///
    /// default: null
    String? unicodeEmoji,

    /// whether the role should be mentionable
    ///
    /// default: false
    bool? mentionable,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.post(
        '$_basePath/$guildId/roles',
        data: {
          if (name != null) 'name': name,
          if (permissions != null)
            'permissions': const PermissionConverter().toJson(permissions),
          if (color != null) 'color': color,
          if (hoist != null) 'hoist': hoist,
          if (iconImageData != null) 'icon': iconImageData,
          if (unicodeEmoji != null) 'unicode_emoji': unicodeEmoji,
          if (mentionable != null) 'mentionable': mentionable,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Role.fromJson(data),
    );
  }

  /// Modify the positions of a set of role objects for the guild. Requires the
  /// MANAGE_ROLES permission. Returns a list of all of the guild's role
  /// objects on success. Fires multiple Guild Role Update Gateway events.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-role-positions
  Future<DiscordResponse<List<Role>>> modifyGuildRolePositions(
    String guildId, {
    required ModifyGuildRolePositionsParams params,
    String? reason,
  }) async {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/roles',
        data: params,
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) =>
          (data as List).map((role) => Role.fromJson(role)).toList(),
    );
  }

  // TODO: The rest of them
}
