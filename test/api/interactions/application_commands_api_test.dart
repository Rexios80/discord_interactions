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
        name: 'test_name',
        description: 'test description',
      );
      command = response.success!.data;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('Get global appliction command', () async {
      final response = await api.applicationCommands
          .getGlobalApplicationCommand(command.id!);
      final fetchedCommand = response.success!.data;
      expect(fetchedCommand.name, 'test_name');
    });

    late final List<ApplicationCommand> commands;

    test('Get global application commands', () async {
      final response =
          await api.applicationCommands.getGlobalApplicationCommands();
      commands = response.success!.data;
      expect(commands.length, greaterThan(0));
      expect(commands.map((e) => e.name), contains('test_name'));
    });

    test('Edit global application command', () async {
      final response =
          await api.applicationCommands.editGlobalApplicationCommand(
        command.id!,
        name: 'edited_name',
      );
      final editedCommand = response.success!.data;
      expect(editedCommand.name, 'edited_name');
    });

    test('Bulk overwrite global application commands', () async {
      final response = await api.applicationCommands
          .bulkOverwriteGlobalApplicationCommands(commands);
      final newCommands = response.success!.data;
      expect(newCommands.map((e) => e.name), contains('test_name'));
    });

    test('Delete global application command', () async {
      final response =
          await api.applicationCommands.deleteGlobalApplicationCommand(
        command.id!,
      );

      expect(response.failure, isNull);
    });

    test(
      'Delete all global commands',
      () async {
        final response = await api.applicationCommands
            .bulkOverwriteGlobalApplicationCommands([]);
        expect(response.failure, isNull);
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
        guildId,
        name: 'test_name',
        description: 'test description',
      );
      command = response.success!.data;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('Get guild appliction command', () async {
      final response = await api.applicationCommands.getGuildApplicationCommand(
        guildId,
        commandId: command.id!,
      );
      final fetchedCommand = response.success!.data;
      expect(fetchedCommand.name, 'test_name');
    });

    late final List<ApplicationCommand> commands;

    test('Get guild application commands', () async {
      final response =
          await api.applicationCommands.getGuildApplicationCommands(guildId);
      commands = response.success!.data;
      expect(commands.length, greaterThan(0));
      expect(commands.map((e) => e.name), contains('test_name'));
    });

    test('Edit guild application command', () async {
      final response =
          await api.applicationCommands.editGuildApplicationCommand(
        guildId,
        commandId: command.id!,
        name: 'edited_name',
      );
      final editedCommand = response.success!.data;
      expect(editedCommand.name, 'edited_name');
    });

    test('Bulk overwrite guild application commands', () async {
      final response = await api.applicationCommands
          .bulkOverwriteGuildApplicationCommands(guildId, commands: commands);
      final newCommands = response.success!.data;
      expect(newCommands.map((e) => e.name), contains('test_name'));
    });

    test('Delete guild application command', () async {
      final response =
          await api.applicationCommands.deleteGuildApplicationCommand(
        guildId,
        commandId: command.id!,
      );
      expect(response.failure, isNull);
    });

    test(
      'Delete all guild commands',
      () async {
        final guildId = credentials.guildId;

        final response =
            await api.applicationCommands.bulkOverwriteGuildApplicationCommands(
          guildId,
          commands: [],
        );

        expect(response.failure, isNull);
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
        guildId,
        name: 'test_name',
        description: 'test description',
      );
      command = response.success!.data;
    });

    test('Edit application command permissions', () async {
      final response =
          await api.applicationCommands.editApplicationCommandPermissions(
        guildId,
        commandId: command.id!,
        permissions: [
          ApplicationCommandPermissions(
            id: roleId,
            type: ApplicationCommandPermissionType.role,
            permission: true,
          ),
        ],
      );
      final permissions = response.success!.data;
      expect(permissions.permissions.length, 1);
    });

    test('Get guild application command permissions', () async {
      final response =
          await api.applicationCommands.getGuildApplicationCommandPermissions(
        guildId,
      );
      final guildPermissions = response.success!.data;
      expect(guildPermissions.length, 1);
    });

    test('Get application command permissions', () async {
      final response =
          await api.applicationCommands.getApplicationCommandPermissions(
        guildId,
        commandId: command.id!,
      );
      final fetchedPermissions = response.success!.data;
      expect(fetchedPermissions.permissions.length, 1);
    });

    test('Batch edit application command permissions', () async {
      final response =
          await api.applicationCommands.batchEditApplicationCommandPermissions(
        guildId,
        permissions: [],
      );
      final batchPermissions = response.success!.data;
      expect(batchPermissions.length, 0);
    });

    tearDownAll(() async {
      await api.applicationCommands.deleteGuildApplicationCommand(
        guildId,
        commandId: command.id!,
      );
    });
  });
}
