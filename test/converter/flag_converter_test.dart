import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/converter/flag/application_flag_converter.dart';
import 'package:discord_interactions/src/converter/flag/message_flag_converter.dart';
import 'package:discord_interactions/src/converter/flag/user_flag_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Application flag converter', () {
    final converter = ApplicationFlagConverter();

    for (final flag in ApplicationFlag.values) {
      final json = converter.toJson([flag]);
      final converted = converter.fromJson(json);
      expect(converted, [flag]);
    }
  });

  test('Message flag converter', () {
    final converter = MessageFlagConverter();

    for (final flag in MessageFlag.values) {
      final json = converter.toJson([flag]);
      final converted = converter.fromJson(json);
      expect(converted, [flag]);
    }
  });

  test('User flag converter', () {
    final converter = UserFlagConverter();

    for (final flag in UserFlag.values) {
      final json = converter.toJson([flag]);
      final converted = converter.fromJson(json);
      expect(converted, [flag]);
    }
  });
}
