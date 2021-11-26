import 'package:test/test.dart';

import '../test_utils.dart';

void main() async {
  await setup();

  test(
    'Get sticker',
    () async {
      final response = await api.stickers.getSticker(credentials.stickerId);
      expect(response.data!.id, credentials.stickerId);
    },
    skip: 'Don\'t have any stickers to test with',
  );

  test('Get nitro sticker packs', () async {
    final response = await api.stickers.getNitroStickerPacks();
    expect(response.data!.length, greaterThan(0));
    await avoidRateLimit();
  });

  test('Get guild stickers', () async {
    final response = await api.stickers.getGuildStickers(credentials.guildId);
    expect(response.error, isNull);
    await avoidRateLimit();
  });

  test(
    'Get guild sticker',
    () async {
      final response = await api.stickers.getGuildSticker(
        credentials.guildId,
        stickerId: credentials.stickerId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    },
    skip: 'Don\'t have any stickers to test with',
  );

  test('Create guild sticker', () async {
    // TODO
  });

  test('Modify guild sticker', () async {
    // TODO
  });

  test('Delete guild sticker', () async {
    // TODO
  });
}
