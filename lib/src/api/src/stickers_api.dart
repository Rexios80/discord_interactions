// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

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
  Future<DiscordResponse<Sticker>> getSticker(String stickerId) async {
    return validateApiCall(
      _dio.get('/stickers/$stickerId'),
      responseTransformer: (data) => Sticker.fromJson(data),
    );
  }

  /// Returns the list of sticker packs available to Nitro subscribers.
  ///
  /// https://discord.com/developers/docs/resources/sticker#list-nitro-sticker-packs
  Future<DiscordResponse<List<StickerPack>>> getNitroStickerPacks() async {
    return validateApiCall(
      _dio.get('/stickers-packs'),
      responseTransformer: (data) => (data['sticker_packs'] as List)
          .map((e) => StickerPack.fromJson(e))
          .toList(),
    );
  }

  /// Returns an array of sticker objects for the given guild. Includes user
  /// fields if the bot has the MANAGE_EMOJIS_AND_STICKERS permission.
  ///
  /// https://discord.com/developers/docs/resources/sticker#list-guild-stickers
  Future<DiscordResponse<List<Sticker>>> getGuildStickers(
    String guildId,
  ) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/stickers'),
      responseTransformer: (data) =>
          (data as List).map((e) => Sticker.fromJson(e)).toList(),
    );
  }

  /// Returns a sticker object for the given guild and sticker IDs. Includes the
  /// user field if the bot has the MANAGE_EMOJIS_AND_STICKERS permission.
  ///
  /// https://discord.com/developers/docs/resources/sticker#get-guild-sticker
  Future<DiscordResponse<Sticker>> getGuildSticker(
    String guildId, {
    required String stickerId,
  }) async {
    return validateApiCall(
      _dio.get('$_basePath/$guildId/stickers/$stickerId'),
      responseTransformer: (data) => Sticker.fromJson(data),
    );
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
  Future<DiscordResponse<Sticker>> createGuildSticker(
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
    return validateApiCall(
      _dio.post(
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
      ),
      responseTransformer: (data) => Sticker.fromJson(data),
    );
  }

  /// Modify the given sticker. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns the updated sticker object on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/sticker#modify-guild-sticker
  Future<DiscordResponse<Sticker>> modifyGuildSticker(
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
    return validateApiCall(
      _dio.patch(
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
      ),
      responseTransformer: (data) => Sticker.fromJson(data),
    );
  }

  /// Delete the given sticker. Requires the MANAGE_EMOJIS_AND_STICKERS
  /// permission. Returns 204 No Content on success.
  ///
  /// This endpoint supports the X-Audit-Log-Reason header.
  ///
  /// https://discord.com/developers/docs/resources/sticker#delete-guild-sticker
  Future<DiscordResponse<void>> deleteGuildSticker(
    String guildId, {
    required String stickerId,
    String? reason,
  }) {
    return validateApiCall(
      _dio.delete(
        '$_basePath/$guildId/stickers/$stickerId',
        options: Options(
          headers: {
            if (reason != null) DiscordHeader.auditLogReason: reason,
          },
        ),
      ),
    );
  }
}
