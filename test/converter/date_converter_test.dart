// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/src/converter/date/iso8601_converter.dart';
import 'package:discord_interactions/src/converter/date/unix_time_converter.dart';

void main() {
  test('ISO8601 converter', () {
    final converter = ISO8601Converter();

    final timestamp = DateTime.now();
    final json = converter.toJson(timestamp);
    final converted = converter.fromJson(json);

    expect(converted, timestamp);
  });

  test('ISO8601 converter nullable', () {
    final converter = ISO8601ConverterNullable();

    final timestamp = DateTime.now();
    final json = converter.toJson(timestamp);
    final converted = converter.fromJson(json);

    expect(converted, timestamp);
  });

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
