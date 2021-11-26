// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Image data is a Data URI scheme that supports JPG, GIF, and PNG formats
///
/// https://discord.com/developers/docs/reference#image-data
class ImageData {
  /// Create an image data string from a base64 encoded image
  static String fromBase64(String base64, ImageFormat format) =>
      'data:${format.mimeType};base64,$base64';

  ImageData._();
}
