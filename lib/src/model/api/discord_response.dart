/// A response from Discord
class DiscordResponse<T> {
  /// The response data
  T? data;

  /// The raw response data
  ///
  /// This should only be used for testing purposes and not in production code
  dynamic raw;

  /// The response error
  Object? error;

  /// Create a [DiscordResponse] with [data]
  DiscordResponse.success(this.data, this.raw) : error = null;

  /// Create a [DiscordResponse] with [error]
  DiscordResponse.error(this.error, {this.raw}) : data = null;
}
