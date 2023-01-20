// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Access to the Stickers API
///
/// https://discord.com/developers/docs/resources/sticker#sticker-resource
class StickersApi {
  static const _basePath = '/guilds';

  final Dio _dio;

  /// Constructor
  StickersApi(this._dio);

  /// Returns a sticker object for the given sticker ID.
  ///
  /// https://discord.com/developers/docs/resources/sticker#get-sticker
  Future<ValidatedResponse<Map<String, dynamic>, Sticker>> getSticker(
    String stickerId,
  ) {
    return _dio
        .get<Map<String, dynamic>>('/stickers/$stickerId')
        .validate(transform: Sticker.fromJson);
  }

  /// Returns the list of sticker packs available to Nitro subscribers.
  ///
  /// https://discord.com/developers/docs/resources/sticker#list-nitro-sticker-packs
  Future<ValidatedResponse<Map<String, dynamic>, List<StickerPack>>>
      getNitroStickerPacks() {
    return _dio.get<Map<String, dynamic>>('/sticker-packs').validate(
          transform: (data) => (data['sticker_packs'] as List)
              .cast<Map<String, dynamic>>()
              .map(StickerPack.fromJson)
              .toList(),
        );
  }

  /// Returns an array of sticker objects for the given guild. Includes user
  /// fields if the bot has the MANAGE_EMOJIS_AND_STICKERS permission.
  ///
  /// https://discord.com/developers/docs/resources/sticker#list-guild-stickers
  Future<ValidatedResponse<Map<String, dynamic>, List<Sticker>>>
      getGuildStickers(
    String guildId,
  ) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$guildId/stickers')
        .validate(
          transform: (data) => (data as List)
              .cast<Map<String, dynamic>>()
              .map(Sticker.fromJson)
              .toList(),
        );
  }

  /// Returns a sticker object for the given guild and sticker IDs. Includes the
  /// user field if the bot has the MANAGE_EMOJIS_AND_STICKERS permission.
  ///
  /// https://discord.com/developers/docs/resources/sticker#get-guild-sticker
  Future<ValidatedResponse<Map<String, dynamic>, Sticker>> getGuildSticker(
    String guildId, {
    required String stickerId,
  }) {
    return _dio
        .get<Map<String, dynamic>>('$_basePath/$guildId/stickers/$stickerId')
        .validate(transform: Sticker.fromJson);
  }

  /// Create a new sticker for the guild. Send a multipart/form-data body.
  /// Requires the MANAGE_EMOJIS_AND_STICKERS permission. Returns the new
  /// sticker object on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// Lottie stickers can only be uploaded on guilds that have either the
  /// VERIFIED and/or the PARTNERED guild feature.
  ///
  /// https://discord.com/developers/docs/resources/sticker#create-guild-sticker
  Future<ValidatedResponse<Map<String, dynamic>, Sticker>> createGuildSticker(
    String guildId, {

    /// name of the sticker (2-30 characters)
    required String name,

    /// description of the sticker (empty or 2-100 characters)
    required String description,

    /// autocomplete/suggestion tags for the sticker (max 200 characters)
    required String tags,

    /// the sticker file to upload, must be a PNG, APNG, or Lottie JSON file,
    /// max 500 KB
    required MultipartFile file,
    String? reason,
  }) {
    return _dio
        .post<Map<String, dynamic>>(
          '$_basePath/$guildId/stickers',
          data: FormData.fromMap({
            'name': name,
            'description': description,
            'tags': tags,
            'file': file,
          }),
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Sticker.fromJson);
  }

  /// Modify the given sticker. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns the updated sticker object on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/sticker#modify-guild-sticker
  Future<ValidatedResponse<Map<String, dynamic>, Sticker>> modifyGuildSticker(
    String guildId, {
    required String stickerId,

    /// name of the sticker (2-30 characters)
    String? name,

    /// description of the sticker (empty or 2-100 characters)
    String? description,

    /// autocomplete/suggestion tags for the sticker (max 200 characters)
    String? tags,
    String? reason,
  }) {
    return _dio
        .patch<Map<String, dynamic>>(
          '$_basePath/$guildId/stickers/$stickerId',
          data: {
            if (name != null) 'name': name,
            if (description != null) 'description': description,
            if (tags != null) 'tags': tags,
          },
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate(transform: Sticker.fromJson);
  }

  /// Delete the given sticker. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns 204 No Content on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/sticker#delete-guild-sticker
  Future<ValidatedResponse<void, void>> deleteGuildSticker(
    String guildId, {
    required String stickerId,
    String? reason,
  }) {
    return _dio
        .delete(
          '$_basePath/$guildId/stickers/$stickerId',
          options: Options(
            headers: {
              if (reason != null) DiscordHeader.auditLogReason: reason,
            },
          ),
        )
        .validate();
  }
}
