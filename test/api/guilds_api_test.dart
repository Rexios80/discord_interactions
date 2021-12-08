// Dart imports:
import 'dart:io';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_utils.dart';

void main() async {
  await setup();

  late final String guildId;

  setUpAll(() async {
    final response = await api.guilds.createGuild(
      name: 'test_guild',
      channels: [
        Channel(
          id: '0',
          type: ChannelType.guildCategory,
          name: 'test_category',
        ),
        Channel(
          id: '1',
          type: ChannelType.guildText,
          parentId: '0',
          name: 'test_channel_1',
        ),
        Channel(
          id: '2',
          type: ChannelType.guildText,
          parentId: '0',
          name: 'test_channel_2',
        ),
      ],
      roles: [
        Role(
          id: '0',
          name: 'test_role_1',
          color: DiscordColor.azure,
          hoist: false,
          position: 0,
          permissions: [],
          managed: false,
          mentionable: true,
        ),
        Role(
          id: '1',
          name: 'test_role_2',
          color: DiscordColor.red,
          hoist: false,
          position: 1,
          permissions: [],
          managed: false,
          mentionable: true,
        ),
      ],
    );
    expect(response.error, isNull);
    expect(response.data?.name, 'test_guild');
    expect(response.data?.roles?.length, 2);

    guildId = response.data!.id;

    await avoidRateLimit();
  });

  group('Basic operations:', () {
    test('Get guild', () async {
      final response = await api.guilds.getGuild(guildId);
      expect(response.error, isNull);
      expect(response.data?.name, 'test_guild');

      await avoidRateLimit();
    });

    test('Get guild preview', () async {
      final response = await api.guilds.getGuildPreview(guildId);
      expect(response.error, isNull);
      expect(response.data?.name, 'test_guild');

      await avoidRateLimit();
    });

    test('Modify guild', () async {
      final response =
          await api.guilds.modifyGuild(guildId, name: 'test_guild_modified');
      expect(response.error, isNull);
      expect(response.data?.name, 'test_guild_modified');

      await avoidRateLimit();
    });
  });

  group('Channels:', () {
    test('Get guild channels', () async {
      final response = await api.guilds.getGuildChannels(guildId);
      expect(response.error, isNull);
      expect(response.data?.length, 3);

      await avoidRateLimit();
    });

    test('Modify guild channel positions', () async {
      final response = await api.guilds.modifyGuildChannelPositions(
        guildId,
        params: [
          ModifyGuildChannelPositionsParams(
            id: '2',
            position: 1,
            lockPermissions: true,
          ),
        ],
      );
      expect(response.error, isNull);

      await avoidRateLimit();
    });
  });

  group('Members:', () {
    test('Get guild member', () async {
      final response = await api.guilds
          .getGuildMember(guildId, userId: credentials.applicationId);
      expect(response.error, isNull);
      expect(response.data?.user?.id, credentials.applicationId);

      await avoidRateLimit();
    });

    test('List guild members', () async {
      final response = await api.guilds.listGuildMembers(guildId);
      expect(response.error, isNull);
      expect(response.data?.length, 1);

      await avoidRateLimit();
    });

    test('Search guild members', () async {
      final response = await api.guilds
          .searchGuildMembers(guildId, query: 'discord_interactions_test');
      expect(response.error, isNull);
      expect(response.data?.length, 1);

      await avoidRateLimit();
    });

    test(
      'Add guild member',
      () async {
        final response = await api.guilds.addGuildMember(
          guildId,
          userId: credentials.userId,
          accessToken: credentials.userAccessToken,
        );
        expect(response.error, isNull);
        expect(response.data?.user?.id, credentials.userId);

        await avoidRateLimit();
      },
      skip: 'Need an access token',
    );

    test('Modify current member', () async {
      final response = await api.guilds.modifyCurrentMember(
        guildId,
        nick: 'test_nick_modified',
      );
      expect(response.error, isNull);
      expect(response.data?.nick, 'test_nick_modified');

      await avoidRateLimit();
    });
  });

  group('Roles:', () {
    late final String roleId;

    setUpAll(() async {
      final response = await api.guilds.createGuildRole(
        guildId,
        name: 'test_role_3',
        color: DiscordColor.green,
        hoist: false,
        permissions: [],
        mentionable: true,
      );
      expect(response.error, isNull);
      expect(response.data?.name, 'test_role_3');

      roleId = response.data!.id;

      await avoidRateLimit();
    });

    test('Get guild roles', () async {
      final response = await api.guilds.getGuildRoles(guildId);
      expect(response.error, isNull);
      expect(response.data?.length, 3);

      await avoidRateLimit();
    });

    test('Add guild member role', () async {
      final response = await api.guilds.addGuildMemberRole(
        guildId,
        userId: credentials.applicationId,
        roleId: roleId,
      );
      expect(response.error, isNull);

      await avoidRateLimit();
    });

    test('Remove guild member role', () async {
      final response = await api.guilds.removeGuildMemberRole(
        guildId,
        userId: credentials.applicationId,
        roleId: roleId,
      );
      expect(response.error, isNull);

      await avoidRateLimit();
    });

    test('Modify guild role positions', () async {
      final response = await api.guilds.modifyGuildRolePositions(
        guildId,
        params: [
          ModifyGuildRolePositionsParams(
            id: roleId,
            position: 1,
          ),
        ],
      );
      expect(response.error, isNull);
      expect(response.data?.last.id, roleId);
      expect(response.data?.last.position, 1);

      await avoidRateLimit();
    });

    test('Modify guild role', () async {
      final response = await api.guilds.modifyGuildRole(
        guildId,
        roleId: roleId,
        name: 'test_role_modified',
        color: DiscordColor.blue,
      );
      expect(response.error, isNull);
      expect(response.data?.name, 'test_role_modified');

      await avoidRateLimit();
    });

    tearDownAll(() async {
      final response =
          await api.guilds.deleteGuildRole(guildId, roleId: roleId);
      expect(response.error, isNull);

      await avoidRateLimit();
    });
  });

  group('Pruning:', () {
    test('Get guild prune count', () async {
      final response = await api.guilds.getGuildPruneCount(guildId);
      expect(response.error, isNull);
      expect(response.data, isNotNull);

      await avoidRateLimit();
    });

    test('Begin guild prune', () async {
      final response = await api.guilds.beginGuildPrune(
        guildId,
        days: 1,
      );
      expect(response.error, isNull);

      await avoidRateLimit();
    });
  });

  test('Get guild voice regions', () async {
    final response = await api.guilds.getGuildVoiceRegions(guildId);
    expect(response.error, isNull);
    expect(response.data?.length, greaterThan(0));

    await avoidRateLimit();
  });

  // These must run in order
  group('Integrations:', () {
    late final String integrationId;

    test('Get guild integrations', () async {
      final response = await api.guilds.getGuildIntegrations(guildId);
      expect(response.error, isNull);
      expect(response.data?.length, greaterThan(0));

      integrationId = response.data!.first.id;

      await avoidRateLimit();
    });

    test('Delete guild integration', () async {
      final response = await api.guilds.deleteGuildIntegration(
        guildId,
        integrationId: integrationId,
      );
      expect(response.error, isNull);

      await avoidRateLimit();
    });
  });

  group('Guild widget:', () {
    // Must enable the guild widget before getting the image
    setUpAll(() async {
      final response = await api.guilds.modifyGuildWidgetSettings(
        guildId,
        enabled: true,
      );
      expect(response.error, isNull);

      await avoidRateLimit();
    });

    test('Get guild widget settings', () async {
      final response = await api.guilds.getGuildWidgetSettings(guildId);
      expect(response.error, isNull);

      await avoidRateLimit();
    });

    test('Get guild widget', () async {
      final response = await api.guilds.getGuildWidget(guildId);
      expect(response.error, isNull);

      await avoidRateLimit();
    });

    test('Get guild widget image', () async {
      final response = await api.guilds
          .getGuildWidgetImage(guildId, style: GuildWidgetStyle.banner1);
      expect(response.error, isNull);

      File('test_resources/guild_widget_image.png')
          .writeAsBytesSync(response.data!);

      await avoidRateLimit();
    });
  });

  group(
    'Guild welcome screen:',
    () {
      test('Modify guild welcome screen', () async {
        final response = await api.guilds.modifyGuildWelcomeScreen(
          credentials.guildId,
          enabled: true,
        );
        expect(response.error, isNull);

        await avoidRateLimit();
      });

      test('Get guild welcome screen', () async {
        final response =
            await api.guilds.getGuildWelcomeScreen(credentials.guildId);
        expect(response.error, isNull);

        await avoidRateLimit();
      });
    },
    skip: 'Need a guild with a welcome screen',
  );

  group(
    'User voice state:',
    () {
      test('Modify current user voice state', () async {
        final response = await api.guilds.modifyCurrentUserVoiceState(
          guildId,
          channelId: '',
        );
        expect(response.error, isNull);

        await avoidRateLimit();
      });

      test('Modify user voice state', () async {
        final response = await api.guilds.modifyUserVoiceState(
          guildId,
          userId: credentials.applicationId,
          channelId: '',
        );
        expect(response.error, isNull);

        await avoidRateLimit();
      });
    },
    skip: 'Not sure if these are testable',
  );

  test(
    'Get guild vanity url',
    () async {
      final response = await api.guilds.getGuildVanityUrl(credentials.guildId);
      expect(response.error, isNull);
    },
    skip: 'Need a guild with a vanity url',
  );

  // These must run in order
  group(
    'Moderation:',
    () {
      test('Create invite link', () async {
        final channelsResponse = await api.guilds.getGuildChannels(guildId);
        final channelId = channelsResponse.data!
            .firstWhere((e) => e.type == ChannelType.guildText)
            .id;

        final response = await api.channels.createChannelInvite(channelId);
        print(
          'Join the server with this link: https://discord.gg/${response.data!.code}',
        );

        await Future.delayed(Duration(seconds: 10));
      });

      test('Modify guld member', () async {
        final response = await api.guilds.modifyGuildMember(
          guildId,
          userId: credentials.userId,
          nick: 'test_nick',
        );
        expect(response.error, isNull);
        expect(response.data?.nick, 'test_nick');

        await avoidRateLimit();
      });

      test('Remove guild member', () async {
        final response = await api.guilds.removeGuildMember(
          guildId,
          userId: credentials.userId,
        );
        expect(response.error, isNull);

        await avoidRateLimit();
      });

      test('Wait for rejoin', () async {
        print('Join the server again');
        await Future.delayed(Duration(seconds: 10));
      });

      test('Create guild ban', () async {
        final response = await api.guilds.createGuildBan(
          guildId,
          userId: credentials.userId,
        );
        expect(response.error, isNull);

        await avoidRateLimit();
      });

      test('Get guild bans', () async {
        final response = await api.guilds.getGuildBans(guildId);
        expect(response.error, isNull);
        expect(response.data?.length, 1);

        await avoidRateLimit();
      });

      test('Get guild ban', () async {
        final response = await api.guilds.getGuildBan(
          guildId,
          userId: credentials.userId,
        );
        expect(response.error, isNull);
        expect(response.data?.user.id, credentials.userId);

        await avoidRateLimit();
      });

      test('Remove guild ban', () async {
        final response = await api.guilds.removeGuildBan(
          guildId,
          userId: credentials.userId,
        );
        expect(response.error, isNull);

        await avoidRateLimit();
      });
    },
    skip: 'Required user interaction',
  );

  tearDownAll(() async {
    final response = await api.guilds.deleteGuild(guildId);
    expect(response.error, isNull);

    await avoidRateLimit();
  });
}
