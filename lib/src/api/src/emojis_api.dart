// Package imports:
import 'package:dio/dio.dart';
import 'package:dio_response_validator/dio_response_validator.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Emojis API
///
/// https://discord.com/developers/docs/resources/emoji#emoji-resource
class EmojisApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  EmojisApi(this._dio);

  /// Returns a list of [Emoji] objects for the given guild.
  ///
  /// https://discord.com/developers/docs/resources/emoji#list-guild-emojis
  Future<DiscordResponse<List<Emoji>>> listGuildEmojis(String guildId) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/emojis'),
      responseTransformer: (data) =>
          (data as List).map((e) => Emoji.fromJson(e)).toList(),
    );
  }

  /// Returns an emoji object for the given guild and emoji IDs.
  ///
  /// https://discord.com/developers/docs/resources/emoji#get-guild-emoji
  Future<DiscordResponse<Emoji>> getGuildEmoji(
    String guildId, {
    required String emojiId,
  }) {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/emojis/$emojiId'),
      responseTransformer: (data) => Emoji.fromJson(data),
    );
  }

  /// Create a new emoji for the guild. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns the new emoji object on success. Fires a Guild Emojis
  /// Update Gateway event.
  ///
  /// Emojis and animated emojis have a maximum file size of 256kb. Attempting
  /// to upload an emoji larger than this limit will fail and return 400 Bad
  /// Request and an error message, but not a JSON status code.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/emoji#create-guild-emoji
  Future<DiscordResponse<Emoji>> createGuildEmoji(
    String guildId, {

    /// name of the emoji
    required String name,

    /// the 128x128 emoji image
    ///
    /// Use [ImageData.fromBase64] to create this string
    required String imageData,

    /// roles allowed to use this emoji
    List<String>? roles,
    String? reason,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$guildId/emojis',
        data: {
          'name': name,
          'image': imageData,
          if (roles != null) 'roles': roles,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Emoji.fromJson(data),
    );
  }

  /// Modify the given emoji. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns the updated emoji object on success. Fires a Guild
  /// Emojis Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/emoji#modify-guild-emoji
  Future<DiscordResponse<Emoji>> modifyGuildEmoji(
    String guildId, {
    required String emojiId,

    /// name of the emoji
    String? name,

    /// roles allowed to use this emoji
    List<String>? roles,
    String? reason,
  }) {
    return validateApiCall(
      _dio.patch(
        '$_basePath/$guildId/emojis/$emojiId',
        data: {
          if (name != null) 'name': name,
          if (roles != null) 'roles': roles,
        },
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
      responseTransformer: (data) => Emoji.fromJson(data),
    );
  }

  /// Delete the given emoji. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns 204 No Content on success. Fires a Guild Emojis
  /// Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/emoji#delete-guild-emoji
  Future<ValidatedResponse<void, void>> deleteGuildEmoji(
    String guildId, {
    required String emojiId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/emojis/$emojiId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }
}
