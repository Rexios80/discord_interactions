// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Access to the Guild Scheduled Events API
class GuildScheduledEventsApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  GuildScheduledEventsApi(this._dio);

  /// Returns a list of [GuildScheduledEvent] objects for the given guild.
  ///
  /// https://discord.com/developers/docs/resources/guild-scheduled-event#list-scheduled-events-for-guild
  Future<ValidatedResponse<List, List<GuildScheduledEvent>>>
      listScheduledEventsForGuild(
    String guildId, {
    /// include number of users subscribed to each event
    bool? withUserCount,
  }) {
    return _dio.get<List>(
      '$_basePath/$guildId/scheduled-events',
      queryParameters: {
        if (withUserCount != null) 'with_user_count': withUserCount,
      },
    ).validate(
      transform: (data) => data
          .cast<Map<String, dynamic>>()
          .map(GuildScheduledEvent.fromJson)
          .toList(),
    );
  }

  /// Create a guild scheduled event in the guild. Returns a
  /// [GuildScheduledEvent] object on success.
  ///
  /// A guild can have a maximum of 100 events with SCHEDULED or ACTIVE status
  /// at any time.
  ///
  /// https://discord.com/developers/docs/resources/guild-scheduled-event#create-guild-scheduled-event
  Future<ValidatedResponse<Map<String, dynamic>, GuildScheduledEvent>>
      createGuildScheduledEvent(
    String guildId, {
    /// the channel id of the scheduled event.
    ///
    /// Optional for events with 'entity_type': EXTERNAL
    String? channelId,

    /// the entity metadata of the scheduled event
    GuildScheduledEventEntityMetadata? entityMetadata,

    /// the name of the scheduled event
    required String name,

    /// the privacy level of the scheduled event
    required PrivacyLevel privacyLevel,

    /// the time to schedule the scheduled event
    required DateTime scheduledStartTime,

    /// the time when the scheduled event is scheduled to end
    DateTime? scheduledEndTime,

    /// the description of the scheduled event
    String? description,

    /// the entity type of the scheduled event
    required GuildScheduledEventEntityType entityType,
  }) {
    return _dio.post<Map<String, dynamic>>(
      '$_basePath/$guildId/scheduled-events',
      data: {
        if (channelId != null) 'channel_id': channelId,
        if (entityMetadata != null) 'entity_metadata': entityMetadata,
        'name': name,
        'privacy_level': privacyLevel.value,
        'scheduled_start_time': scheduledStartTime.toIso8601String(),
        if (scheduledEndTime != null)
          'scheduled_end_time': scheduledEndTime.toIso8601String(),
        if (description != null) 'description': description,
        'entity_type': entityType.value,
      },
    ).validate(transform: GuildScheduledEvent.fromJson);
  }

  /// Get a guild scheduled event. Returns a [GuildScheduledEvent] object on
  /// success.
  ///
  /// https://discord.com/developers/docs/resources/guild-scheduled-event#get-guild-scheduled-event
  Future<ValidatedResponse<Map<String, dynamic>, GuildScheduledEvent>>
      getGuildScheduledEvent(
    String guildId, {
    required String scheduledEventId,

    /// include number of users subscribed to this event
    bool? withUserCount,
  }) {
    return _dio.get<Map<String, dynamic>>(
      '$_basePath/$guildId/scheduled-events/$scheduledEventId',
      queryParameters: {
        if (withUserCount != null) 'with_user_count': withUserCount,
      },
    ).validate(transform: GuildScheduledEvent.fromJson);
  }

  /// Modify a guild scheduled event. Returns the modified [GuildScheduledEvent]
  /// object on success.
  ///
  /// To start or end an event, use this endpoint to modify the event's [status]
  /// field.
  ///
  /// If updating [entityType] to EXTERNAL:
  /// - [channelId] is required and must be set to null
  /// - [entityMetadata] with a location field must be provided
  /// - [scheduledEndTime] must be provided
  ///
  /// https://discord.com/developers/docs/resources/guild-scheduled-event#modify-guild-scheduled-event
  Future<ValidatedResponse<Map<String, dynamic>, GuildScheduledEvent>>
      modifyGuildScheduledEvent(
    String guildId, {
    required String scheduledEventId,

    /// the channel id of the scheduled event, set to null if changing entity
    /// type to EXTERNAL
    String? channelId,

    /// the entity metadata of the scheduled event
    GuildScheduledEventEntityMetadata? entityMetadata,

    /// the name of the scheduled event
    String? name,

    /// the privacy level of the scheduled event
    PrivacyLevel? privacyLevel,

    /// the time to schedule the scheduled event
    DateTime? scheduledStartTime,

    /// the time when the scheduled event is scheduled to end
    DateTime? scheduledEndTime,

    /// the description of the scheduled event
    String? description,

    /// the entity type of the scheduled event
    GuildScheduledEventEntityType? entityType,

    /// the status of the scheduled event
    GuildScheduledEventStatus? status,
  }) {
    return _dio.patch<Map<String, dynamic>>(
      '$_basePath/$guildId/scheduled-events/$scheduledEventId',
      data: {
        if (channelId != null) 'channel_id': channelId,
        if (entityMetadata != null) 'entity_metadata': entityMetadata,
        if (name != null) 'name': name,
        if (privacyLevel != null) 'privacy_level': privacyLevel.value,
        if (scheduledStartTime != null)
          'scheduled_start_time': scheduledStartTime.toIso8601String(),
        if (scheduledEndTime != null)
          'scheduled_end_time': scheduledEndTime.toIso8601String(),
        if (description != null) 'description': description,
        if (entityType != null) 'entity_type': entityType.value,
        if (status != null) 'status': status.value,
      },
    ).validate(transform: GuildScheduledEvent.fromJson);
  }

  /// Delete a guild scheduled event. Returns a 204 on success.
  ///
  /// https://discord.com/developers/docs/resources/guild-scheduled-event#delete-guild-scheduled-event
  Future<ValidatedResponse<void, void>> deleteGuildScheduledEvent(
    String guildId, {
    required String scheduledEventId,
  }) {
    return _dio
        .delete('$_basePath/$guildId/scheduled-events/$scheduledEventId')
        .validate();
  }

  /// Get a list of guild scheduled event users subscribed to a guild scheduled
  /// event. Returns a list of [GuildScheduledEventUser] objects on success.
  /// Guild member data, if it exists, is included if the [withMember] query
  /// parameter is set.
  ///
  /// Provide a user id to [before] and [after] for pagination. Users will
  /// always be returned in ascending order by [userId]. If both [before] and
  /// [after] are provided, only [before] is respected. Fetching users
  /// in-between [before] and [after] is not supported.
  ///
  /// https://discord.com/developers/docs/resources/guild-scheduled-event#get-guild-scheduled-event-users
  Future<ValidatedResponse<List, List<GuildScheduledEventUser>>>
      getGuildScheduledEventUsers(
    String guildId, {
    required String scheduledEventId,

    /// how many users to receive from the event
    ///
    /// Default: 100
    int? limit,

    /// include guild member data if it exists
    ///
    /// Default: false
    bool? withMember,

    /// consider only users before given user id
    ///
    /// Default: null
    String? before,

    /// consider only users after given user id
    ///
    /// Default: null
    String? after,
  }) {
    return _dio.get<List>(
      '$_basePath/$guildId/scheduled-events/$scheduledEventId/users',
      queryParameters: {
        if (limit != null) 'limit': limit,
        if (withMember != null) 'with_member': withMember,
        if (before != null) 'before': before,
        if (after != null) 'after': after,
      },
    ).validate(
      transform: (data) => data
          .cast<Map<String, dynamic>>()
          .map(GuildScheduledEventUser.fromJson)
          .toList(),
    );
  }
}
