// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/src/converter/iso8601_converter.dart';

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
}
