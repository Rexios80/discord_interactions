// Package imports:
import 'package:dio/dio.dart';
import 'package:dio_response_validator/dio_response_validator.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Access to the Guild Templates API
///
/// https://discord.com/developers/docs/resources/guild-template#guild-template-resource
class GuildTemplatesApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  GuildTemplatesApi(this._dio);

  /// Returns a guild template object for the given [code].
  ///
  /// https://discord.com/developers/docs/resources/guild-template#get-guild-template
  Future<ValidatedResponse<Map<String, dynamic>, GuildTemplate>>
      getGuildTemplate(String code) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/templates/$code')
        .validate(transform: GuildTemplate.fromJson);
  }

  /// Create a new guild based on a template. Returns a [Guild] object on
  /// success. Fires a Guild Create Gateway event.
  ///
  /// This endpoint can be used only by bots in less than 10 guilds.
  ///
  /// https://discord.com/developers/docs/resources/guild-template#create-guild-from-guild-template
  Future<ValidatedResponse<Map<String, dynamic>, Guild>>
      createGuildFromGuildTemplate(
    String code, {

    /// name of the guild (2-100 characters)
    required String name,

    /// base64 128x128 image for the guild icon
    ///
    /// Use [ImageData.fromBase64] to create this string
    String? iconImageData,
  }) {
    return _dio.post<Map<String, dynamic>>(
      '$_basePath/templates/$code',
      data: {
        'name': name,
        if (iconImageData != null) 'icon': iconImageData,
      },
    ).validate(transform: Guild.fromJson);
  }

  /// Returns an array of [GuildTemplate] objects. Requires the MANAGE_GUILD
  /// permission.
  ///
  /// https://discord.com/developers/docs/resources/guild-template#get-guild-templates
  Future<ValidatedResponse<Map<String, dynamic>, List<GuildTemplate>>>
      getGuildTemplates(
    String guildId,
  ) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$guildId/templates')
        .validate(
          transform: (data) =>
              (data as List).map((e) => GuildTemplate.fromJson(e)).toList(),
        );
  }

  /// Creates a template for the guild. Requires the MANAGE_GUILD permission.
  /// Returns the created [GuildTemplate] object on success.
  ///
  /// https://discord.com/developers/docs/resources/guild-template#create-guild-template
  Future<ValidatedResponse<Map<String, dynamic>, GuildTemplate>>
      createGuildTemplate(
    String guildId, {

    /// name of the template (1-100 characters)
    required String name,

    /// description for the template (0-120 characters)
    String? description,
  }) {
    return _dio.post<Map<String, dynamic>>(
      '$_basePath/$guildId/templates',
      data: {
        'name': name,
        if (description != null) 'description': description,
      },
    ).validate(transform: GuildTemplate.fromJson);
  }

  /// Syncs the template to the guild's current state. Requires the
  /// MANAGE_GUILD permission. Returns the [GuildTemplate] object on success.
  ///
  /// https://discord.com/developers/docs/resources/guild-template#sync-guild-template
  Future<ValidatedResponse<Map<String, dynamic>, GuildTemplate>>
      syncGuildTemplate(
    String guildId, {
    required String code,
  }) {
    return _dio
        .put<Map<String, dynamic>>('$_basePath/$guildId/templates/$code')
        .validate(transform: GuildTemplate.fromJson);
  }

  /// Modifies the template's metadata. Requires the MANAGE_GUILD permission.
  /// Returns the [GuildTemplate] object on success.
  ///
  /// https://discord.com/developers/docs/resources/guild-template#modify-guild-template
  Future<ValidatedResponse<Map<String, dynamic>, GuildTemplate>>
      modifyGuildTemplate(
    String guildId, {
    required String code,

    /// name of the template (1-100 characters)
    String? name,

    /// description for the template (0-120 characters)
    String? description,
  }) {
    return _dio.patch<Map<String, dynamic>>(
      '$_basePath/$guildId/templates/$code',
      data: {
        if (name != null) 'name': name,
        if (description != null) 'description': description,
      },
    ).validate(transform: GuildTemplate.fromJson);
  }

  /// Deletes the template. Requires the MANAGE_GUILD permission. Returns the
  /// deleted [GuildTemplate] object on success.
  ///
  /// https://discord.com/developers/docs/resources/guild-template#delete-guild-template
  Future<ValidatedResponse<Map<String, dynamic>, GuildTemplate>>
      deleteGuildTemplate(
    String guildId, {
    required String code,
  }) {
    return _dio
        .delete<Map<String, dynamic>>('$_basePath/$guildId/templates/$code')
        .validate(transform: GuildTemplate.fromJson);
  }
}
