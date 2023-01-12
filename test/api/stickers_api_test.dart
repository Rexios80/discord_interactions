// Package imports:
import 'package:test/test.dart';

// Project imports:
import '../test_utils.dart';

void main() async {
  await setup();

  test(
    'Get sticker',
    () async {
      final response = await api.stickers.getSticker(credentials.stickerId);
      expect(response.success!.data.id, credentials.stickerId);
    },
    skip: 'Don\'t have any stickers to test with',
  );

  test('Get nitro sticker packs', () async {
    final response = await api.stickers.getNitroStickerPacks();
    expect(response.success!.data.length, greaterThan(0));
    await avoidRateLimit();
  });

  test('Get guild stickers', () async {
    final response = await api.stickers.getGuildStickers(credentials.guildId);
    expect(response.failure, isNull);
    await avoidRateLimit();
  });

  test(
    'Get guild sticker',
    () async {
      final response = await api.stickers.getGuildSticker(
        credentials.guildId,
        stickerId: credentials.stickerId,
      );
      expect(response.failure, isNull);
      await avoidRateLimit();
    },
    skip: 'Don\'t have any stickers to test with',
  );

  test(
    'Create guild sticker',
    () async {},
    skip: 'Need a boosted server',
  );

  test(
    'Modify guild sticker',
    () async {},
    skip: 'Need a boosted server',
  );

  test(
    'Delete guild sticker',
    () async {},
    skip: 'Need a boosted server',
  );
}
