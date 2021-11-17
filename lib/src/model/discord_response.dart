/// A response from Discord
class DiscordResponse<T> {
  /// The response data
  T? data;

  /// The response error
  Object? error;

  /// Create a [DiscordResponse] with [data]
  DiscordResponse.success(this.data) : error = null;

  /// Create a [DiscordResponse] with [error]
  DiscordResponse.error(this.error) : data = null;
}
