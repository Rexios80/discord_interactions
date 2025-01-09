// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

void main() async {
  test('Emoji', () async {
    /// The recovered timestamp does not have milliseconds
    final timestamp = DateTime.fromMillisecondsSinceEpoch(
      DateTime.timestamp().millisecondsSinceEpoch ~/ 1000,
    );
    final snowflake = Snowflake.fromTimestamp(timestamp);
    final recoveredTimestamp = Snowflake.getTimestamp(snowflake);
    expect(timestamp, recoveredTimestamp);
  });
}
