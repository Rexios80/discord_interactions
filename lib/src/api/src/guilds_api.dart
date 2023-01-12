// Package imports:

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio_response_validator/dio_response_validator.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/permission_converter.dart';
import 'package:discord_interactions/src/converter/flag/system_channel_flag_converter.dart';
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
  /// When using the [roles] parameter, the first member of the array is used to
  /// change properties of the guild's @everyone role. If you are trying to
  /// bootstrap a guild with additional [roles], keep this in mind.
  ///
  /// When using the [roles] parameter, the required [id] field within each
  /// [Role] object is an integer placeholder, and will be replaced by the API
  /// upon consumption. Its purpose is to allow you to overwrite a role's
  /// permissions in a channel when also passing in channels with the [channels]
  /// array.
  ///
  /// When using the [channels] parameter, the [position] field is ignored, and
  /// none of the default channels are created.
  ///
  /// When using the [channels] parameter, the [id] field within each [Channel]
  /// object may be set to an integer placeholder, and will be replaced by the
  /// API upon consumption. Its purpose is to allow you to create GUILD_CATEGORY
  /// channels by setting the [parentId] field on any children to the category's
  /// [id] field. Category channels must be listed before any children.
  ///
  /// https://discord.com/developers/docs/resources/guild#create-guild
  Future<DiscordResponse<Guild>> createGuild({
    /// name of the guild (2-100 characters)
    required String name,

    /// base64 128x128 image for the guild icon
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? iconImageData,

    /// verification level
    VerificationLevel? verificationLevel,

    /// default message notification level
    DefaultMessageNotificationLevel? defaultMessageNotifications,

    /// explicit content filter level
    ExplicitContentFilterLevel? explicitContentFilter,

    /// new guild roles
    List<Role>? roles,

    /// new guild's channels
    List<Channel>? channels,

    /// id for afk channel
    String? afkChannelId,

    /// afk timeout in seconds
    int? afkTimeout,

    /// the id of the channel where guild notices such as welcome messages and
    /// boost events are posted
    String? systemChannelId,

    /// system channel flags
    List<SystemChannelFlag>? systemChannelFlags,
  }) {
    return validateApiCall(
      _dio.post(
        _basePath,
        data: {
          'name': name,
          if (iconImageData != null) 'icon': iconImageData,
          if (verificationLevel != null)
            'verification_level': verificationLevel.value,
          if (defaultMessageNotifications != null)
            'default_message_notifications': defaultMessageNotifications.value,
          if (explicitContentFilter != null)
            'explicit_content_filter': explicitContentFilter.value,
          if (roles != null) 'roles': roles,
          if (channels != null) 'channels': channels,
          if (afkChannelId != null) 'afk_channel_id': afkChannelId,
          if (afkTimeout != null) 'afk_timeout': afkTimeout,
          if (systemChannelId != null) 'system_channel_id': systemChannelId,
          if (systemChannelFlags != null)
            'system_channel_flags':
                const SystemChannelFlagConverter().toJson(systemChannelFlags),
        },
      ),
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
  }) {
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
  Future<DiscordResponse<GuildPreview>> getGuildPreview(String guildId) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/preview'),
      responseTransformer: (data) => GuildPreview.fromJson(data),
    );
  }

  /// Modify a guild's settings. Requires the MANAGE_GUILD permission. Returns
  /// the updated guild object on success. Fires a Guild Update Gateway event.
  ///
  /// All parameters to this endpoint are optional
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild
  Future<DiscordResponse<Guild>> modifyGuild(
    String guildId, {

    /// guild name
    String? name,

    /// verification level
    VerificationLevel? verificationLevel,

    /// default message notification level
    DefaultMessageNotificationLevel? defaultMessageNotifications,

    /// explicit content filter level
    ExplicitContentFilterLevel? explicitContentFilter,

    /// id for afk channel
    String? afkChannelId,

    /// afk timeout in seconds
    int? afkTimeout,

    /// base64 1024x1024 png/jpeg/gif image for the guild icon (can be animated
    /// gif when the server has the ANIMATED_ICON feature)
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? iconImageData,

    /// user id to transfer guild ownership to (must be owner)
    String? ownerId,

    /// base64 16:9 png/jpeg image for the guild splash (when the server has the
    /// INVITE_SPLASH feature)
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? splashImageData,

    /// base64 16:9 png/jpeg image for the guild discovery splash (when the
    /// server has the DISCOVERABLE feature)
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? discoverySplashImageData,

    /// base64 16:9 png/jpeg image for the guild banner (when the server has
    /// the BANNER feature)
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? bannerImageData,

    /// the id of the channel where guild notices such as welcome messages and
    /// boost events are posted
    String? systemChannelId,

    /// system channel flags
    List<SystemChannelFlag>? systemChannelFlags,

    /// the id of the channel where Community guilds display rules and/or
    /// guidelines
    String? rulesChannelId,

    /// the id of the channel where admins and moderators of Community guilds
    /// receive notices from Discord
    String? publicUpdatesChannelId,

    /// the preferred locale of a Community guild used in server discovery and
    /// notices from Discord; defaults to "en-US"
    String? preferredLocale,

    /// enabled guild features
    List<GuildFeature>? features,

    /// the description for the guild, if the guild is discoverable
    String? description,
    String? reason,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId',
        data: {
          if (name != null) 'name': name,
          if (verificationLevel != null)
            'verification_level': verificationLevel.value,
          if (defaultMessageNotifications != null)
            'default_message_notifications': defaultMessageNotifications.value,
          if (explicitContentFilter != null)
            'explicit_content_filter': explicitContentFilter.value,
          if (afkChannelId != null) 'afk_channel_id': afkChannelId,
          if (afkTimeout != null) 'afk_timeout': afkTimeout,
          if (iconImageData != null) 'icon': iconImageData,
          if (ownerId != null) 'owner_id': ownerId,
          if (splashImageData != null) 'splash': splashImageData,
          if (discoverySplashImageData != null)
            'discovery_splash': discoverySplashImageData,
          if (bannerImageData != null) 'banner': bannerImageData,
          if (systemChannelId != null) 'system_channel_id': systemChannelId,
          if (systemChannelFlags != null)
            'system_channel_flags':
                const SystemChannelFlagConverter().toJson(systemChannelFlags),
          if (rulesChannelId != null) 'rules_channel_id': rulesChannelId,
          if (publicUpdatesChannelId != null)
            'public_updates_channel_id': publicUpdatesChannelId,
          if (preferredLocale != null) 'preferred_locale': preferredLocale,
          if (features != null) 'features': features,
          if (description != null) 'description': description,
        },
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
  Future<ValidatedResponse<void, void>> deleteGuild(String guildId) {
    return _dio.delete('$_basePath/$guildId').validate();
  }

  /// Returns a list of guild channel objects. Does not include threads.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-channels
  Future<DiscordResponse<List<Channel>>> getGuildChannels(
    String guildId,
  ) {
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
    required String name,
    ChannelType? type,
    String? topic,
    int? bitrate,
    int? userLimit,
    int? rateLimitPerUser,
    int? position,
    List<PermissionOverwrite>? permissionOverwrites,
    String? parentId,
    bool? nsfw,
    String? reason,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$guildId/channels',
        data: {
          'name': name,
          if (type != null) 'type': type.value,
          if (topic != null) 'topic': topic,
          if (bitrate != null) 'bitrate': bitrate,
          if (userLimit != null) 'user_limit': userLimit,
          if (rateLimitPerUser != null) 'rate_limit_per_user': rateLimitPerUser,
          if (position != null) 'position': position,
          if (permissionOverwrites != null)
            'permission_overwrites': permissionOverwrites,
          if (parentId != null) 'parent_id': parentId,
          if (nsfw != null) 'nsfw': nsfw,
        },
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
  Future<ValidatedResponse<void, void>> modifyGuildChannelPositions(
    String guildId, {
    required List<ModifyGuildChannelPositionsParams> params,
    String? reason,
  }) {
    return _dio
        .patch(
          '$_basePath/$guildId/channels',
          data: params,
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Returns all active threads in the guild, including public and private
  /// threads. Threads are ordered by their id, in descending order.
  ///
  /// https://discord.com/developers/docs/resources/guild#list-active-threads
  Future<DiscordResponse<ListThreadsResponse>> listActiveThreads(
    String guildId,
  ) {
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
  }) {
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
  /// All parameters to this endpoint are optional
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
  }) {
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
  /// All parameters to this endpoint except for query are optional
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
  }) {
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
  /// All parameters to this endpoint except for access_token are optional.
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
  }) {
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
  }) {
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
  }) {
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
  Future<ValidatedResponse<void, void>> addGuildMemberRole(
    String guildId, {
    required String userId,
    required String roleId,
    String? reason,
  }) {
    return _dio
        .put(
          '$_basePath/$guildId/members/$userId/roles/$roleId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Removes a role from a guild member. Requires the MANAGE_ROLES permission.
  /// Returns a 204 empty response on success. Fires a Guild Member Update
  /// Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#remove-guild-member-role
  Future<ValidatedResponse<void, void>> removeGuildMemberRole(
    String guildId, {
    required String userId,
    required String roleId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/members/$userId/roles/$roleId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Remove a member from a guild. Requires KICK_MEMBERS permission. Returns a
  /// 204 empty response on success. Fires a Guild Member Remove Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#remove-guild-member
  Future<ValidatedResponse<void, void>> removeGuildMember(
    String guildId, {
    required String userId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/members/$userId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Returns a list of ban objects for the users banned from this guild.
  /// Requires the BAN_MEMBERS permission.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-bans
  Future<DiscordResponse<List<Ban>>> getGuildBans(String guildId) {
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
  }) {
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
  Future<ValidatedResponse<void, void>> createGuildBan(
    String guildId, {
    required String userId,

    /// number of days to delete messages for (0-7)
    int? deleteMessageDays,
    String? reason,
  }) {
    return _dio
        .put(
          '$_basePath/$guildId/bans/$userId',
          data: {
            'delete_message_days': deleteMessageDays,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Remove the ban for a user. Requires the BAN_MEMBERS permissions. Returns
  /// a 204 empty response on success. Fires a Guild Ban Remove Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#remove-guild-ban
  Future<ValidatedResponse<void, void>> removeGuildBan(
    String guildId, {
    required String userId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/bans/$userId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
              // This is the ONLY api call that freaks out with the default content-type
              // Screw you Discord
              'Content-Type': '',
            },
          ),
        )
        .validate();
  }

  /// Returns a list of [Role] objects for the guild.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-roles
  Future<DiscordResponse<List<Role>>> getGuildRoles(String guildId) {
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
  }) {
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
  /// All parameters to this endpoint are optional and nullable.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-role-positions
  Future<DiscordResponse<List<Role>>> modifyGuildRolePositions(
    String guildId, {
    required List<ModifyGuildRolePositionsParams> params,
    String? reason,
  }) {
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

  /// Modify a guild role. Requires the MANAGE_ROLES permission. Returns the
  /// updated role on success. Fires a Guild Role Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-role
  Future<DiscordResponse<Role>> modifyGuildRole(
    String guildId, {
    required String roleId,

    /// name of the role
    String? name,

    /// bitwise value of the enabled/disabled permissions
    List<Permission>? permissions,

    /// RGB color value
    int? color,

    /// whether the role should be displayed separately in the sidebar
    bool? hoist,

    /// the role's icon image (if the guild has the ROLE_ICONS feature)
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? iconImageData,

    /// the role's unicode emoji as a standard emoji (if the guild has the
    /// ROLE_ICONS feature)
    String? unicodeEmoji,

    /// whether the role should be mentionable
    bool? mentionable,
    String? reason,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/roles/$roleId',
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

  /// Delete a guild role. Requires the MANAGE_ROLES permission. Returns a 204
  /// empty response on success. Fires a Guild Role Delete Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#delete-guild-role
  Future<ValidatedResponse<void, void>> deleteGuildRole(
    String guildId, {
    required String roleId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/roles/$roleId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Returns an object with one 'pruned' key indicating the number of members
  /// that would be removed in a prune operation. Requires the KICK_MEMBERS
  /// permission.
  ///
  /// By default, prune will not remove users with roles. You can optionally
  /// include specific roles in your prune by providing the include_roles
  /// parameter. Any inactive user that has a subset of the provided role(s)
  /// will be counted in the prune and users with additional roles will not.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-prune-count
  Future<DiscordResponse<int>> getGuildPruneCount(
    String guildId, {

    /// number of days to count prune for (1-30)
    ///
    /// default: 7
    int? days,

    /// role(s) to include
    ///
    /// default: none
    List<String>? includeRoleIds,
  }) {
    return validateApiCall(
      _dio.get(
        '$_basePath/$guildId/prune',
        queryParameters: {
          if (days != null) 'days': days,
          if (includeRoleIds != null) 'include_roles': includeRoleIds.join(','),
        },
      ),
      responseTransformer: (data) => data['pruned'] as int,
    );
  }

  /// Begin a prune operation. Requires the KICK_MEMBERS permission. Returns an
  /// object with one 'pruned' key indicating the number of members that were
  /// removed in the prune operation. For large guilds it's recommended to set
  /// the compute_prune_count option to false, forcing 'pruned' to null. Fires
  /// multiple Guild Member Remove Gateway events.
  ///
  /// By default, prune will not remove users with roles. You can optionally
  /// include specific roles in your prune by providing the include_roles
  /// parameter. Any inactive user that has a subset of the provided role(s)
  /// will be included in the prune and users with additional roles will not.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#begin-guild-prune
  Future<DiscordResponse<int?>> beginGuildPrune(
    String guildId, {

    /// number of days to prune (1-30)
    ///
    /// default: 7
    int? days,

    /// whether 'pruned' is returned, discouraged for large guilds
    ///
    /// default: true
    bool? computePruneCount,

    /// role(s) to include
    ///
    /// default: none
    List<String>? includeRoleIds,
    String? reason,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$guildId/prune',
        data: {
          if (days != null) 'days': days,
          if (computePruneCount != null)
            'compute_prune_count': computePruneCount,
          if (includeRoleIds != null) 'include_roles': includeRoleIds.join(','),
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => data['pruned'] as int?,
    );
  }

  /// Returns a list of voice region objects for the guild. Unlike the similar
  /// /voice route, this returns VIP servers when the guild is VIP-enabled.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-voice-regions
  Future<DiscordResponse<List<VoiceRegion>>> getGuildVoiceRegions(
    String guildId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/regions'),
      responseTransformer: (data) =>
          (data as List).map((region) => VoiceRegion.fromJson(region)).toList(),
    );
  }

  /// Returns a list of invite objects (with invite metadata) for the guild.
  /// Requires the MANAGE_GUILD permission.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-invites
  Future<DiscordResponse<List<Invite>>> getGuildInvites(
    String guildId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/invites'),
      responseTransformer: (data) =>
          (data as List).map((invite) => Invite.fromJson(invite)).toList(),
    );
  }

  /// Returns a list of integration objects for the guild. Requires the
  /// MANAGE_GUILD permission.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-integrations
  Future<DiscordResponse<List<Integration>>> getGuildIntegrations(
    String guildId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/integrations'),
      responseTransformer: (data) => (data as List)
          .map((integration) => Integration.fromJson(integration))
          .toList(),
    );
  }

  /// Delete the attached integration object for the guild. Deletes any
  /// associated webhooks and kicks the associated bot if there is one.
  /// Requires the MANAGE_GUILD permission. Returns a 204 empty response on
  /// success. Fires a Guild Integrations Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#delete-guild-integration
  Future<ValidatedResponse<void, void>> deleteGuildIntegration(
    String guildId, {
    required String integrationId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/integrations/$integrationId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }

  /// Returns a guild widget object. Requires the MANAGE_GUILD permission.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-widget-settings
  Future<DiscordResponse<GuildWidget>> getGuildWidgetSettings(
    String guildId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/widget'),
      responseTransformer: (data) => GuildWidget.fromJson(data),
    );
  }

  /// Modify a guild widget object for the guild. All attributes may be passed
  /// in with JSON and modified. Requires the MANAGE_GUILD permission. Returns
  /// the updated guild widget object.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-widget
  Future<DiscordResponse<GuildWidget>> modifyGuildWidgetSettings(
    String guildId, {
    bool? enabled,
    String? channelId,
    String? reason,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/widget',
        data: {
          if (enabled != null) 'enabled': enabled,
          if (channelId != null) 'channel_id': channelId,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => GuildWidget.fromJson(data),
    );
  }

  /// Returns the widget for the guild.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-widget
  Future<ValidatedResponse<Map<String, dynamic>, Map<String, dynamic>>>
      getGuildWidget(String guildId) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$guildId/widget.json')
        .validate();
  }

  /// Returns a partial invite object for guilds with that feature enabled.
  /// Requires the MANAGE_GUILD permission. code will be null if a vanity url
  /// for the guild is not set.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-vanity-url
  Future<DiscordResponse<Invite>> getGuildVanityUrl(String guildId) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/vanity-url'),
      responseTransformer: (data) => Invite.fromJson(data),
    );
  }

  /// Returns a PNG image widget for the guild. Requires no permissions or
  /// authentication.
  ///
  /// All parameters to this endpoint are optional.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-widget-image
  Future<ValidatedResponse<List<int>, List<int>>> getGuildWidgetImage(
    String guildId, {

    /// style of the widget image returned
    ///
    /// default: [GuildWidgetStyle.shield]
    GuildWidgetStyle? style,
  }) {
    return _dio
        .get<List<int>>(
          '$_basePath/$guildId/widget.png',
          queryParameters: {
            if (style != null) 'style': style.value,
          },
          options: Options(
            responseType: ResponseType.bytes,
          ),
        )
        .validate();
  }

  /// Returns the Welcome Screen object for the guild.
  ///
  /// https://discord.com/developers/docs/resources/guild#get-guild-welcome-screen
  Future<DiscordResponse<WelcomeScreen>> getGuildWelcomeScreen(
    String guildId,
  ) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/welcome-screen'),
      responseTransformer: (data) => WelcomeScreen.fromJson(data),
    );
  }

  /// Modify the guild's Welcome Screen. Requires the MANAGE_GUILD permission.
  /// Returns the updated Welcome Screen object.
  ///
  /// All parameters to this endpoint are optional and nullable
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-guild-welcome-screen
  Future<DiscordResponse<WelcomeScreen>> modifyGuildWelcomeScreen(
    String guildId, {

    /// whether the welcome screen is enabled
    bool? enabled,

    /// channels linked in the welcome screen and their display options
    List<WelcomeScreenChannel>? welcomeChannels,

    /// the server description to show in the welcome screen
    String? description,
    String? reason,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/welcome-screen',
        data: {
          if (enabled != null) 'enabled': enabled,
          if (welcomeChannels != null) 'welcome_channels': welcomeChannels,
          if (description != null) 'description': description,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => WelcomeScreen.fromJson(data),
    );
  }

  /// Updates the current user's voice state.
  ///
  /// Caveats
  ///
  /// There are currently several caveats for this endpoint:
  ///
  /// channel_id must currently point to a stage channel.
  ///
  /// current user must already have joined channel_id.
  ///
  /// You must have the MUTE_MEMBERS permission to unsuppress yourself. You
  /// can always suppress yourself.
  ///
  /// You must have the REQUEST_TO_SPEAK permission to request to speak. You
  /// can always clear your own request to speak.
  ///
  /// You are able to set request_to_speak_timestamp to any present or future
  /// time.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-current-user-voice-state
  Future<ValidatedResponse<void, void>> modifyCurrentUserVoiceState(
    String guildId, {

    /// the id of the channel the user is currently in
    required String channelId,

    /// toggles the user's suppress state
    bool? suppress,

    /// sets the user's request to speak
    DateTime? requestToSpeakTimestamp,
  }) {
    return _dio.patch(
      '$_basePath/$guildId/voice-states/@me',
      data: {
        'channel_id': channelId,
        if (suppress != null) 'suppress': suppress,
        if (requestToSpeakTimestamp != null)
          'request_to_speak_timestamp':
              requestToSpeakTimestamp.toIso8601String(),
      },
    ).validate();
  }

  /// Updates another user's voice state.
  ///
  /// Caveats
  ///
  /// There are currently several caveats for this endpoint:
  ///
  /// channel_id must currently point to a stage channel.
  ///
  /// current user must already have joined channel_id.
  ///
  /// You must have the MUTE_MEMBERS permission to unsuppress yourself. You
  /// can always suppress yourself.
  ///
  /// You must have the REQUEST_TO_SPEAK permission to request to speak. You
  /// can always clear your own request to speak.
  ///
  /// You are able to set request_to_speak_timestamp to any present or future
  /// time.
  ///
  /// https://discord.com/developers/docs/resources/guild#modify-user-voice-state
  Future<ValidatedResponse<void, void>> modifyUserVoiceState(
    String guildId, {
    required String userId,

    /// the id of the channel the user is currently in
    required String channelId,

    /// toggles the user's suppress state
    bool? suppress,
  }) {
    return _dio.patch(
      '$_basePath/$guildId/voice-states/$userId',
      data: {
        'channel_id': channelId,
        if (suppress != null) 'suppress': suppress,
      },
    ).validate();
  }
}
