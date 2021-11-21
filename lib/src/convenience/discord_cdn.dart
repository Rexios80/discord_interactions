// Project imports:
import 'package:discord_interactions/src/convenience/convenience.dart';

/// Discord uses ids and hashes to render images in the client. These hashes can
/// be retrieved through various API requests, like Get User. Below are the
/// formats, size limitations, and CDN endpoints for images in Discord. The
/// returned format can be changed by changing the extension name at the end of
/// the URL. The returned size can be changed by appending a querystring
/// of ?size=desired_size to the URL. Image size can be any power of two between
/// 16 and 4096.
///
/// https://discord.com/developers/docs/reference#image-formatting
///
/// In the case of endpoints that support GIFs, the hash will begin with a_ if
/// it is available in GIF format. (example: a_1269e74af4df7417b13759eae50c83dc)
///
/// These methods automatically return .gif endpoints for animates images and
/// .png endpoints for static images. This behavior can be overridden by passing
/// the `format` parameter.
class DiscordCdn {
  /// The base url for the Discord CDN
  static const imageBaseUrl = 'https://cdn.discordapp.com';

  /// Path: emojis/emoji_id.png
  ///
  /// Supports: PNG, JPEG, WebP, GIF
  static String emoji(
    String emojiId, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(emojiId);
    return '$imageBaseUrl/emojis/$emojiId${format.extension}';
  }

  /// Path: icons/guild_id/guild_icon.png
  ///
  /// Supports: PNG, JPEG, WebP, GIF
  static String guildIcon(
    String guildId,
    String guildIcon, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(guildIcon);
    return '$imageBaseUrl/icons/$guildId/$guildIcon${format.extension}';
  }

  /// Path: splashes/guild_id/guild_splash.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String guildSplash(
    String guildId,
    String guildSplash, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(guildSplash);
    return '$imageBaseUrl/splashes/$guildId/$guildSplash${format.extension}';
  }

  /// Path: discovery-splashes/guild_id/guild_discovery_splash.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String guildDiscoverySplash(
    String guildId,
    String guildDiscoverySplash, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(guildDiscoverySplash);
    return '$imageBaseUrl/discovery-splashes/$guildId/$guildDiscoverySplash${format.extension}';
  }

  /// Path: banners/guild_id/guild_banner.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String guildBanner(
    String guildId,
    String guildBanner, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(guildBanner);
    return '$imageBaseUrl/banners/$guildId/$guildBanner${format.extension}';
  }

  /// Path: banners/user_id/user_banner.png
  ///
  /// Supports: PNG, JPEG, WebP, GIF
  static String userBanner(
    String userId,
    String userBanner, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(userBanner);
    return '$imageBaseUrl/banners/$userId/$userBanner${format.extension}';
  }

  /// Path: embed/avatars/user_discriminator.png
  ///
  /// Supports: PNG
  ///
  /// In the case of the Default User Avatar endpoint, the value for
  /// user_discriminator in the path should be the user's discriminator modulo
  /// 5—Test#1337 would be 1337 % 5, which evaluates to 2.
  ///
  /// In the case of the Default User Avatar and Sticker endpoints, the size
  /// of images returned is constant with the "size" querystring parameter
  /// being ignored.
  static String defaultUserAvatar(int userDiscriminator) {
    int discriminator = userDiscriminator % 5;
    return '$imageBaseUrl/embed/avatars/$discriminator${ImageFormat.png.extension}';
  }

  /// Path: avatars/user_id/user_avatar.png
  ///
  /// Supports: PNG, JPEG, WebP, GIF
  static String userAvatar(
    String userId,
    String userAvatar, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(userAvatar);
    return '$imageBaseUrl/avatars/$userId/$userAvatar${format.extension}';
  }

  /// Path: guilds/guild_id/users/user_id/avatars/member_avatar.png
  ///
  /// Supports: PNG, JPEG, WebP, GIF
  static String guildMemberAvatar(
    String guildId,
    String userId,
    String memberAvatar, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(memberAvatar);
    return '$imageBaseUrl/guilds/$guildId/users/$userId/avatars/$memberAvatar${format.extension}';
  }

  /// Path: app-icons/application_id/icon.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String applicationIcon(
    String applicationId,
    String icon, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(icon);
    return '$imageBaseUrl/app-icons/$applicationId/$icon${format.extension}';
  }

  /// Path: app-icons/application_id/cover_image.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String applicationCover(
    String applicationId,
    String coverImage, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(coverImage);
    return '$imageBaseUrl/app-icons/$applicationId/$coverImage${format.extension}';
  }

  /// Path: app-assets/application_id/asset_id.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String applicationAsset(
    String applicationId,
    String assetId, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(assetId);
    return '$imageBaseUrl/app-assets/$applicationId/$assetId${format.extension}';
  }

  /// Path: app-assets/application_id/achievements/achievement_id/icons/icon_hash.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String achievementIcon(
    String applicationId,
    String achievementId,
    String iconHash, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(iconHash);
    return '$imageBaseUrl/app-assets/$applicationId/achievements/$achievementId/icons/$iconHash${format.extension}';
  }

  /// Path: app-assets/710982414301790216/store/sticker_pack_banner_asset_id.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String stickerPackBanner(
    String stickerPackBannerAssetId, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(stickerPackBannerAssetId);
    return '$imageBaseUrl/app-assets/710982414301790216/store/$stickerPackBannerAssetId${format.extension}';
  }

  /// Path: team-icons/team_id/team_icon.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String teamIcon(
    String teamId,
    String teamIcon, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(teamIcon);
    return '$imageBaseUrl/team-icons/$teamId/$teamIcon${format.extension}';
  }

  /// Path: stickers/sticker_id.png
  ///
  /// Supports: PNG, Lottie
  ///
  /// In the case of the Default User Avatar and Sticker endpoints, the size
  /// of images returned is constant with the "size" querystring parameter
  /// being ignored.
  ///
  /// In the case of the Sticker endpoint, the sticker will be available as PNG
  /// if its format_type is PNG or APNG, and as Lottie if its format_type is
  /// LOTTIE.
  static String sticker(
    String stickerId, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(stickerId);
    return '$imageBaseUrl/stickers/$stickerId${format.extension}';
  }

  /// Path: role-icons/role_id/role_icon.png
  ///
  /// Supports: PNG, JPEG, WebP
  static String roleIcon(
    String roleId,
    String roleIcon, {
    ImageFormat? format,
  }) {
    format ??= _defaultFormatForHash(roleIcon);
    return '$imageBaseUrl/role-icons/$roleId/$roleIcon${format.extension}';
  }

  static ImageFormat _defaultFormatForHash(String hash) =>
      _isGif(hash) ? ImageFormat.gif : ImageFormat.png;

  static bool _isGif(String id) => id.startsWith('a_');

  DiscordCdn._();
}
