/// A response from Discord
class DiscordResponse<T> {
  /// The response status code
  final int? statusCode;

  /// The response data
  final T? data;

  /// The raw response data
  ///
  /// This should only be used for testing purposes and not in production code
  final dynamic raw;

  /// The response error
  final DiscordError? error;

  /// Create a [DiscordResponse] with [data]
  DiscordResponse.success(
    this.data, {
    required this.statusCode,
    required this.raw,
  }) : error = null;

  /// Create a [DiscordResponse] with [error]
  DiscordResponse.error(
    Object error,
    StackTrace stacktrace, {
    this.statusCode,
    this.raw,
  })  : error = DiscordError(error, stacktrace),
        data = null;
}

/// Class to hold an [error] and [stacktrace]
class DiscordError {
  /// The response error
  final Object error;

  /// The error's stack trace
  final StackTrace stacktrace;

  /// Create a [DiscordError] with an [error] and [stacktrace]
  DiscordError(this.error, this.stacktrace);

  @override
  String toString() {
    return '$error\n$stacktrace';
  }
}
