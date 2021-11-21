/// Encodes emoji to be used in urls
class EmojiEncoder {
  static String urlEncode(String name, String id) =>
      Uri.encodeComponent('$name:$id');
}
