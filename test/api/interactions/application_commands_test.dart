// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../../test_config.dart';

void main() async {
  await setup();

  group('Global commands:', () {
    test('Global command tests', () async {
      final createCommandResponse =
          await api.applicationCommands.createGlobalApplicationCommand(
        ApplicationCommand(
          name: 'test_name',
          description: 'test description',
        ),
      );
      final command = createCommandResponse.data!;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');

      final getCommandResponse = await api.applicationCommands
          .getGlobalApplicationCommand(command.id!);
      final fetchedCommand = getCommandResponse.data!;
      expect(fetchedCommand.name, 'test_name');

      final getCommandsResponse =
          await api.applicationCommands.getGlobalApplicationCommands();
      final commands = getCommandsResponse.data!;
      expect(commands.length, greaterThan(0));
      expect(commands[0].name, 'test_name');

      final editCommandResponse =
          await api.applicationCommands.editGlobalApplicationCommand(
        ApplicationCommand(id: command.id, name: 'edited_name'),
      );
      final editedCommand = editCommandResponse.data!;
      expect(editedCommand.name, 'edited_name');

      final getNewCommandsResponse = await api.applicationCommands
          .bulkOverwriteGlobalApplicationCommands(commands);
      final newCommands = getNewCommandsResponse.data!;
      expect(newCommands[0].name, 'test_name');

      await api.applicationCommands.deleteGlobalApplicationCommand(
        command.id!,
      );

      final getCommandsAfterDeleteResponse =
          await api.applicationCommands.getGlobalApplicationCommands();
      final commandsAfterDelete = getCommandsAfterDeleteResponse.data!;
      expect(commandsAfterDelete.length, 0);
    });

    test(
      'Delete all global commands',
      () async {
        await api.applicationCommands
            .bulkOverwriteGlobalApplicationCommands([]);
      },
      skip: 'This test only runs manually',
    );
  });

  group('Guild commands:', () {
    final guildId = applicationInfo['guildId'] as String;

    test('Guild command tests', () async {
      final createCommandResponse =
          await api.applicationCommands.createGuildApplicationCommand(
        ApplicationCommand(
          name: 'test_name',
          description: 'test description',
        ),
        guildId: guildId,
      );
      final command = createCommandResponse.data!;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');

      final getCommandResponse =
          await api.applicationCommands.getGuildApplicationCommand(
        command.id!,
        guildId: guildId,
      );
      final fetchedCommand = getCommandResponse.data!;
      expect(fetchedCommand.name, 'test_name');

      final getCommandsResponse = await api.applicationCommands
          .getGuildApplicationCommands(guildId: guildId);
      final commands = getCommandsResponse.data!;
      expect(commands.length, greaterThan(0));
      expect(commands[0].name, 'test_name');

      final editCommandResponse =
          await api.applicationCommands.editGuildApplicationCommand(
        ApplicationCommand(id: command.id, name: 'edited_name'),
        guildId: guildId,
      );
      final editedCommand = editCommandResponse.data!;
      expect(editedCommand.name, 'edited_name');

      final getNewCommandsResponse = await api.applicationCommands
          .bulkOverwriteGuildApplicationCommands(commands, guildId: guildId);
      final newCommands = getNewCommandsResponse.data!;
      expect(newCommands[0].name, 'test_name');

      await api.applicationCommands.deleteGuildApplicationCommand(
        command.id!,
        guildId: guildId,
      );

      final getCommandsAfterDeleteResponse = await api.applicationCommands
          .getGuildApplicationCommands(guildId: guildId);
      final commandsAfterDelete = getCommandsAfterDeleteResponse.data!;
      expect(commandsAfterDelete.length, 0);
    });

    test(
      'Delete all global commands',
      () async {
        await api.applicationCommands
            .bulkOverwriteGlobalApplicationCommands([]);
      },
      skip: 'This test only runs manually',
    );
  });

  test('Guild command permissions:', () async {
    final guildId = applicationInfo['guildId'] as String;
    final roleId = applicationInfo['roleId'] as String;

    final createCommandResponse =
        await api.applicationCommands.createGuildApplicationCommand(
      ApplicationCommand(
        name: 'test_name',
        description: 'test description',
      ),
      guildId: guildId,
    );
    final command = createCommandResponse.data!;

    final permissionsResponse =
        await api.applicationCommands.editApplicationCommandPermissions(
      command.id!,
      guildId: guildId,
      permissions: [
        ApplicationCommandPermissions(
          id: roleId,
          type: ApplicationCommandPermissionType.role,
          permission: true,
        ),
      ],
    );
    final permissions = permissionsResponse.data!;
    expect(permissions.permissions.length, 1);

    final getGuildPermissionsResponse =
        await api.applicationCommands.getGuildApplicationCommandPermissions(
      guildId: guildId,
    );
    final guildPermissions = getGuildPermissionsResponse.data!;
    expect(guildPermissions.length, 1);

    final getPermissionsResponse =
        await api.applicationCommands.getApplicationCommandPermissions(
      command.id!,
      guildId: guildId,
    );
    final fetchedPermissions = getPermissionsResponse.data!;
    expect(fetchedPermissions.permissions.length, 1);

    final batchPermissionsResponse =
        await api.applicationCommands.batchEditApplicationCommandPermissions(
      [],
      guildId: guildId,
    );
    final batchPermissions = batchPermissionsResponse.data!;
    expect(batchPermissions.length, 0);
  });
}
