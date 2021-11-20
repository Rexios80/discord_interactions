/// Discord utilizes Twitter's snowflake format for uniquely identifiable
/// descriptors (IDs). These IDs are guaranteed to be unique across all of
/// Discord, except in some unique scenarios in which child objects share their
/// parent's ID. Because Snowflake IDs are up to 64 bits in size (e.g. a uint64),
/// they are always returned as strings in the HTTP API to prevent integer
/// overflows in some languages. See Gateway ETF/JSON for more information
/// regarding Gateway encoding.
///
/// https://discord.com/developers/docs/reference#snowflakes
class Snowflake {
  /// The first second of 2015 or 1420070400000
  static const discordEpoch = 1420070400000;

  /// Read a snowflake's timstamp
  static DateTime getTimestamp(String snowflake) {
    final int snowflakeInt = int.parse(snowflake);
    final timestamp = (snowflakeInt >> 22) + discordEpoch;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  /// We typically use snowflake IDs in many of our API routes for pagination.
  /// The standardized pagination paradigm we utilize is one in which you can
  /// specify IDs before and after in combination with limit to retrieve a
  /// desired page of results. You will want to refer to the specific endpoint
  /// documentation for details.
  ///
  /// It is useful to note that snowflake IDs are just numbers with a timestamp,
  /// so when dealing with pagination where you want results from the beginning
  /// of time (in Discord Epoch, but 0 works here too) or before/after a specific
  /// time you can generate a snowflake ID for that time.
  ///
  /// https://discord.com/developers/docs/reference#snowflake-ids-in-pagination
  static String fromTimestamp(DateTime timestamp) {
    final snowflakeInt =
        (timestamp.millisecondsSinceEpoch - discordEpoch) << 22;
    return snowflakeInt.toString();
  }

  Snowflake._();
}
