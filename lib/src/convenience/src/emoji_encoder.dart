/// Encodes emoji to be used in urls
class EmojiEncoder {
  /// Encodes the given emoji [name] and [id] into a string Discord likes
  static String urlEncode(String name, String id) =>
      Uri.encodeComponent('$name:$id');
}
