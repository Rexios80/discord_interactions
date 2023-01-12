// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_utils.dart';

void main() async {
  await setup();

  test('Emoji', () async {
    final emojiId = credentials.emojiId;
    final cdnUrl = DiscordCdn.emoji(emojiId);
    await dio.get(cdnUrl);
  });

  group('Guild:', () {
    late final Guild guild;

    setUpAll(() async {
      final response = await api.guilds.getGuild(credentials.guildId);
      guild = response.success!.data;
    });

    test('Guild icon', () async {
      final cdnUrl = DiscordCdn.guildIcon(guild.id, guild.icon!);
      await dio.get(cdnUrl);
    });

    test(
      'Guild splash',
      () async {
        final cdnUrl = DiscordCdn.guildSplash(guild.id, guild.splash!);
        await dio.get(cdnUrl);
      },
      skip: 'Need a boosted guild',
    );

    test(
      'Guild discovery splash',
      () async {
        final cdnUrl =
            DiscordCdn.guildDiscoverySplash(guild.id, guild.discoverySplash!);
        await dio.get(cdnUrl);
      },
      skip: 'Need a boosted guild',
    );

    test(
      'Guild banner',
      () async {
        final cdnUrl = DiscordCdn.guildBanner(guild.id, guild.banner!);
        await dio.get(cdnUrl);
      },
      skip: 'Need a boosted guild',
    );
  });

  group('User:', () {
    late final GuildMember member;

    setUpAll(() async {
      final response = await api.guilds
          .getGuildMember(credentials.guildId, userId: credentials.userId);
      member = response.success!.data;
    });

    test('Default user avatar', () async {
      final cdnUrl =
          DiscordCdn.defaultUserAvatar(int.parse(member.user!.discriminator));
      await dio.get(cdnUrl);
    });

    test('User avatar', () async {
      final cdnUrl =
          DiscordCdn.userAvatar(member.user!.id, member.user!.avatar!);
      await dio.get(cdnUrl);
    });

    test('Guild member avatar', () async {
      final cdnUrl = DiscordCdn.guildMemberAvatar(
        credentials.guildId,
        member.user!.id,
        member.avatar!,
      );
      await dio.get(cdnUrl);
    });
  });

  group(
    'Application:',
    () {
      test('Application icon', () async {});

      test('Application cover', () async {});

      test('Application asset', () async {});

      test('Achievement icon', () async {});
    },
    skip: 'Don\'t have an application to test with',
  );

  group('Sticker pack:', () {
    late final StickerPack stickerPack;

    setUpAll(() async {
      final response = await api.stickers.getNitroStickerPacks();
      stickerPack = response.success!.data.first;
    });

    test('Sicker pack banner', () async {
      final cdnUrl = DiscordCdn.stickerPackBanner(stickerPack.bannerAssetId);
      await dio.get(cdnUrl);
    });
  });

  test(
    'Team icon',
    () async {},
    skip: 'Don\'t have a team to test with',
  );

  test(
    'Sticker',
    () async {
      final stickerId = credentials.stickerId;
      final cdnUrl = DiscordCdn.sticker(stickerId);
      await dio.get(cdnUrl);
    },
    skip: 'Don\'t have any stickers to test with',
  );

  test(
    'Role icon',
    () async {
      final roleId = credentials.roleId;
      final roleIconId = credentials.roleIconId;
      final cdnUrl = DiscordCdn.roleIcon(roleId, roleIconId);
      await dio.get(cdnUrl);
    },
    skip: 'Don\'t have any role icons to test with',
  );
}
