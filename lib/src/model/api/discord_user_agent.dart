/// Clients using the HTTP API must provide a valid User Agent which specifies
/// information about the client library and version
class DiscordUserAgent {
  /// A url containing information about your bot
  final String url;

  /// Your bot's version number
  final String versionNumber;

  /// Extra information you would like to provide
  final String? extra;

  /// Creates a new [DiscordUserAgent] with the given [url], [versionNumber],
  /// and optional [extra] information
  const DiscordUserAgent({
    required this.url,
    required this.versionNumber,
    this.extra,
  });

  @override
  String toString() {
    return 'DiscordBot ($url, $versionNumber)' +
        (extra != null ? ', $extra' : '');
  }
}
