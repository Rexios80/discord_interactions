// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../../test_utils.dart';

  // These tests must be run in the written order to pass
void main() async {
  await setup();

  group('Global commands:', () {
    late final ApplicationCommand command;

    test('Create global appliction command', () async {
      final response =
          await api.applicationCommands.createGlobalApplicationCommand(
        ApplicationCommand(
          name: 'test_name',
          description: 'test description',
        ),
      );
      command = response.data!;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('Get global appliction command', () async {
      final response = await api.applicationCommands
          .getGlobalApplicationCommand(command.id!);
      final fetchedCommand = response.data!;
      expect(fetchedCommand.name, 'test_name');
    });

    late final List<ApplicationCommand> commands;

    test('Get global application commands', () async {
      final response =
          await api.applicationCommands.getGlobalApplicationCommands();
      commands = response.data!;
      expect(commands.length, greaterThan(0));
      expect(commands.map((e) => e.name), contains('test_name'));
    });

    test('Edit global application command', () async {
      final response =
          await api.applicationCommands.editGlobalApplicationCommand(
        ApplicationCommand(id: command.id, name: 'edited_name'),
      );
      final editedCommand = response.data!;
      expect(editedCommand.name, 'edited_name');
    });

    test('Bulk overwrite global application commands', () async {
      final response = await api.applicationCommands
          .bulkOverwriteGlobalApplicationCommands(commands);
      final newCommands = response.data!;
      expect(newCommands.map((e) => e.name), contains('test_name'));
    });

    test('Delete global application command', () async {
      final response =
          await api.applicationCommands.deleteGlobalApplicationCommand(
        command.id!,
      );

      expect(response.error, isNull);
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
    final guildId = credentials.guildId;
    late final ApplicationCommand command;

    test('Create guild application command', () async {
      final response =
          await api.applicationCommands.createGuildApplicationCommand(
        ApplicationCommand(
          name: 'test_name',
          description: 'test description',
        ),
        guildId: guildId,
      );
      command = response.data!;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('Get guild appliction command', () async {
      final response = await api.applicationCommands.getGuildApplicationCommand(
        command.id!,
        guildId: guildId,
      );
      final fetchedCommand = response.data!;
      expect(fetchedCommand.name, 'test_name');
    });

    late final List<ApplicationCommand> commands;

    test('Get guild application commands', () async {
      final response = await api.applicationCommands
          .getGuildApplicationCommands(guildId: guildId);
      commands = response.data!;
      expect(commands.length, greaterThan(0));
      expect(commands.map((e) => e.name), contains('test_name'));
    });

    test('Edit guild application command', () async {
      final response =
          await api.applicationCommands.editGuildApplicationCommand(
        ApplicationCommand(id: command.id, name: 'edited_name'),
        guildId: guildId,
      );
      final editedCommand = response.data!;
      expect(editedCommand.name, 'edited_name');
    });

    test('Bulk overwrite guild application commands', () async {
      final response = await api.applicationCommands
          .bulkOverwriteGuildApplicationCommands(commands, guildId: guildId);
      final newCommands = response.data!;
      expect(newCommands.map((e) => e.name), contains('test_name'));
    });

    test('Delete guild application command', () async {
      final response =
          await api.applicationCommands.deleteGuildApplicationCommand(
        command.id!,
        guildId: guildId,
      );
      expect(response.error, isNull);
    });

    test(
      'Delete all guild commands',
      () async {
        final guildId = credentials.guildId;

        await api.applicationCommands
            .bulkOverwriteGuildApplicationCommands([], guildId: guildId);
      },
      skip: 'This test only runs manually',
    );
  });

  group('Guild command permissions:', () {
    final guildId = credentials.guildId;
    final roleId = credentials.roleId;
    late final ApplicationCommand command;

    setUpAll(() async {
      final response =
          await api.applicationCommands.createGuildApplicationCommand(
        ApplicationCommand(
          name: 'test_name',
          description: 'test description',
        ),
        guildId: guildId,
      );
      command = response.data!;
    });

    test('Edit application command permissions', () async {
      final response =
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
      final permissions = response.data!;
      expect(permissions.permissions.length, 1);
    });

    test('Get guild application command permissions', () async {
      final response =
          await api.applicationCommands.getGuildApplicationCommandPermissions(
        guildId: guildId,
      );
      final guildPermissions = response.data!;
      expect(guildPermissions.length, 1);
    });

    test('Get application command permissions', () async {
      final response =
          await api.applicationCommands.getApplicationCommandPermissions(
        command.id!,
        guildId: guildId,
      );
      final fetchedPermissions = response.data!;
      expect(fetchedPermissions.permissions.length, 1);
    });

    test('Batch edit application command permissions', () async {
      final response =
          await api.applicationCommands.batchEditApplicationCommandPermissions(
        [],
        guildId: guildId,
      );
      final batchPermissions = response.data!;
      expect(batchPermissions.length, 0);
    });

    tearDownAll(() async {
      await api.applicationCommands.deleteGuildApplicationCommand(
        command.id!,
        guildId: guildId,
      );
    });
  });
}
