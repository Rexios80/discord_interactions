import 'package:discord_interactions/discord_interactions.dart';
import 'package:test/test.dart';

import '../test_config.dart';

void main() async {
  await setup();

  test('Emoji', () async {
    final emojiId = applicationInfo['emojiId'];
    final cdnUrl = DiscordCdn.emoji(emojiId);
    await dio.get(cdnUrl);
  });

  // TODO: Need the ability to fetch guilds first
  // final guildId = applicationInfo['guildId'];
  // final guildResponse = await api.guilds.getGuild(guildId);
  // final guild = guildResponse.data!;
  group('Guild:', () {
    test('Guild icon', () async {
      // TODO
    });

    test('Guild splash', () async {
      // TODO
    });

    test('Guild discovery splash', () async {
      // TODO
    });

    test('Guild banner', () async {
      // TODO
    });
  });

  final userId = applicationInfo['userId'];
  final userResponse = await api.users.getUser(userId);
  final user = userResponse.data!;
  group('User:', () {
    test('User banner', () async {
      final cdnUrl = DiscordCdn.userBanner(userId, user.banner!);
      await dio.get(cdnUrl);
    });

    test('Default user avatar', () async {
      final cdnUrl =
          DiscordCdn.defaultUserAvatar(int.parse(user.discriminator));
      await dio.get(cdnUrl);
    });

    test('User avatar', () async {
      final cdnUrl = DiscordCdn.userAvatar(userId, user.avatar!);
      await dio.get(cdnUrl);
    });

    test('Guild member avatar', () async {
      // TODO
      // final cdnUrl = DiscordCdn.guildMemberAvatar(guildId, userId);
      // await dio.get(cdnUrl);
    });
  });

  group('Application:', () {
    test('Application icon', () async {
      // TODO
    });

    test('Application cover', () async {
      // TODO
    });

    test('Application asset', () async {
      // TODO
    });

    test('Achievement icon', () async {
      // TODO
    });
  });

  test('Sicker pack banner', () async {
    // TODO
  });

  test('Team icon', () async {
    // TODO
  });

  test(
    'Sticker',
    () async {
      final stickerId = applicationInfo['stickerId'];
      final cdnUrl = DiscordCdn.sticker(stickerId);
      await dio.get(cdnUrl);
    },
    skip: 'Don\'t have any stickers to test with',
  );

  test(
    'Role icon',
    () async {
      final roleId = applicationInfo['roleId'];
      final roleIconId = applicationInfo['rolIconId'];
      final cdnUrl = DiscordCdn.roleIcon(roleId, roleIconId);
      await dio.get(cdnUrl);
    },
    skip: 'Don\'t have any role icons to test with',
  );
}
