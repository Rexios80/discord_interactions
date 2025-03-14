// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_utils.dart';

void main() async {
  await setup();

  late final String emojiId;

  setUpAll(() async {
    final emojiFile = File(path.join('test_resources', 'test_emoji.gif'));
    final emojiBytes = await emojiFile.readAsBytes();
    final emojiBase64 = base64Encode(emojiBytes);
    final emojiImageData = ImageData.fromBase64(emojiBase64, ImageFormat.gif);

    final response = await api.emojis.createGuildEmoji(
      credentials.guildId,
      name: 'test_emoji',
      imageData: emojiImageData,
      reason: 'Testing reasons',
    );
    emojiId = response.success!.data.id!;
    expect(response.success!.data.name, 'test_emoji');
    await avoidRateLimit();
  });

  test('List guild emojis', () async {
    final response = await api.emojis.listGuildEmojis(credentials.guildId);
    expect(response.success!.data.length, greaterThan(0));
    await avoidRateLimit();
  });

  test('Get guild emoji', () async {
    final response =
        await api.emojis.getGuildEmoji(credentials.guildId, emojiId: emojiId);
    expect(response.success!.data.id, emojiId);
    await avoidRateLimit();
  });

  test('Modify guild emoji', () async {
    final response = await api.emojis.modifyGuildEmoji(
      credentials.guildId,
      emojiId: emojiId,
      name: 'test_emoji_modified',
      reason: 'Testing reasons',
    );
    expect(response.success!.data.name, 'test_emoji_modified');
    await avoidRateLimit();
  });

  tearDownAll(() async {
    final response = await api.emojis.deleteGuildEmoji(
      credentials.guildId,
      emojiId: emojiId,
      reason: 'Testing reasons',
    );
    expect(response.failure, isNull);
    await avoidRateLimit();
  });
}
