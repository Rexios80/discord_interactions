/// Image formats
///
/// https://discord.com/developers/docs/reference#image-formatting-image-formats
enum ImageFormat {
  /// Extension: .jpg, .jpeg
  jpeg,

  /// Extension: .png
  png,

  /// Extension: .webp
  webp,

  /// Extension: .gif
  gif,

  /// Extension: .json
  lottie,
}

/// Methods to get information about image formats
extension ImageFormatExtension on ImageFormat {
  /// Returns the extension of the image format
  String get extension {
    switch (this) {
      case ImageFormat.jpeg:
        return '.jpg';
      case ImageFormat.png:
        return '.png';
      case ImageFormat.webp:
        return '.webp';
      case ImageFormat.gif:
        return '.gif';
      case ImageFormat.lottie:
        return '.json';
    }
  }

  /// Returns the mime type of the image format
  String get mimeType {
    switch (this) {
      case ImageFormat.jpeg:
        return 'image/jpeg';
      case ImageFormat.png:
        return 'image/png';
      case ImageFormat.webp:
        return 'image/webp';
      case ImageFormat.gif:
        return 'image/gif';
      case ImageFormat.lottie:
        return 'application/json';
    }
  }
}
