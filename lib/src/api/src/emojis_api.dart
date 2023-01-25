// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

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
  Future<ValidatedResponse<Map<String, dynamic>, List<Emoji>>> listGuildEmojis(
    String guildId,
  ) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$guildId/emojis')
        .validate(
          transform: (data) => (data as List)
              .cast<Map<String, dynamic>>()
              .map(Emoji.fromJson)
              .toList(),
        );
  }

  /// Returns an emoji object for the given guild and emoji IDs.
  ///
  /// https://discord.com/developers/docs/resources/emoji#get-guild-emoji
  Future<ValidatedResponse<Map<String, dynamic>, Emoji>> getGuildEmoji(
    String guildId, {
    required String emojiId,
  }) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$guildId/emojis/$emojiId')
        .validate(transform: Emoji.fromJson);
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
  Future<ValidatedResponse<Map<String, dynamic>, Emoji>> createGuildEmoji(
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
    return _dio
        .post<Map<String, dynamic>>(
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
        )
        .validate(transform: Emoji.fromJson);
  }

  /// Modify the given emoji. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns the updated emoji object on success. Fires a Guild
  /// Emojis Update Gateway event.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/emoji#modify-guild-emoji
  Future<ValidatedResponse<Map<String, dynamic>, Emoji>> modifyGuildEmoji(
    String guildId, {
    required String emojiId,

    /// name of the emoji
    String? name,

    /// roles allowed to use this emoji
    List<String>? roles,
    String? reason,
  }) {
    return _dio
        .patch<Map<String, dynamic>>(
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
        )
        .validate(transform: Emoji.fromJson);
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
