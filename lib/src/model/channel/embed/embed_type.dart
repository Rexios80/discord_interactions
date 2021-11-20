/// Embed types
///
/// Embed types are "loosely defined" and, for the most part, are not used by
/// our clients for rendering. Embed attributes power what is rendered. Embed
/// types should be considered deprecated and might be removed in a future API
/// version.
///
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-types
enum EmbedType {
  /// generic embed rendered from embed attributes
  rich,

  /// image embed
  image,

  /// video embed
  video,

  /// animated gif image embed rendered as a video embed
  gifv,

  /// article embed
  article,

  /// link embed
  link,
}
