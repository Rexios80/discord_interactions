// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/src/converter/date/unix_time_converter.dart';

void main() {
  test('Unix time converter', () {
    final converter = UnixTimeConverter();

    // Microseconds cause issues
    final timestamp = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch,
    );
    final json = converter.toJson(timestamp);
    final converted = converter.fromJson(json);

    expect(converted, timestamp);
  });

  test('Unix time converter nullable', () {
    final converter = UnixTimeConverterNullable();

    // Microseconds cause issues
    final timestamp = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch,
    );
    final json = converter.toJson(timestamp);
    final converted = converter.fromJson(json);

    expect(converted, timestamp);
  });
}
