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
      final (success, failure) =
          await api.applicationCommands.createGlobalApplicationCommand(
        name: 'test_name',
        description: 'test description',
      );
      command = success!.data;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('Get global appliction command', () async {
      final (success, failure) = await api.applicationCommands
          .getGlobalApplicationCommand(command.id!);
      final fetchedCommand = success!.data;
      expect(fetchedCommand.name, 'test_name');
    });

    late final List<ApplicationCommand> commands;

    test('Get global application commands', () async {
      final (success, failure) =
          await api.applicationCommands.getGlobalApplicationCommands();
      commands = success!.data;
      expect(commands.length, greaterThan(0));
      expect(commands.map((e) => e.name), contains('test_name'));
    });

    test('Edit global application command', () async {
      final (success, failure) =
          await api.applicationCommands.editGlobalApplicationCommand(
        command.id!,
        name: 'edited_name',
      );
      final editedCommand = success!.data;
      expect(editedCommand.name, 'edited_name');
    });

    test('Bulk overwrite global application commands', () async {
      final (success, failure) = await api.applicationCommands
          .bulkOverwriteGlobalApplicationCommands(commands);
      final newCommands = success!.data;
      expect(newCommands.map((e) => e.name), contains('test_name'));
    });

    test('Delete global application command', () async {
      final (success, failure) =
          await api.applicationCommands.deleteGlobalApplicationCommand(
        command.id!,
      );

      expect(failure, isNull);
    });

    test(
      'Delete all global commands',
      () async {
        final (success, failure) = await api.applicationCommands
            .bulkOverwriteGlobalApplicationCommands([]);
        expect(failure, isNull);
      },
      skip: 'This test only runs manually',
    );
  });

  group('Guild commands:', () {
    final guildId = credentials.guildId;
    late final ApplicationCommand command;

    test('Create guild application command', () async {
      final (success, failure) =
          await api.applicationCommands.createGuildApplicationCommand(
        guildId,
        name: 'test_name',
        description: 'test description',
      );
      command = success!.data;
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('Get guild appliction command', () async {
      final (success, failure) =
          await api.applicationCommands.getGuildApplicationCommand(
        guildId,
        commandId: command.id!,
      );
      final fetchedCommand = success!.data;
      expect(fetchedCommand.name, 'test_name');
    });

    late final List<ApplicationCommand> commands;

    test('Get guild application commands', () async {
      final (success, failure) =
          await api.applicationCommands.getGuildApplicationCommands(guildId);
      commands = success!.data;
      expect(commands.length, greaterThan(0));
      expect(commands.map((e) => e.name), contains('test_name'));
    });

    test('Edit guild application command', () async {
      final (success, failure) =
          await api.applicationCommands.editGuildApplicationCommand(
        guildId,
        commandId: command.id!,
        name: 'edited_name',
      );
      final editedCommand = success!.data;
      expect(editedCommand.name, 'edited_name');
    });

    test('Bulk overwrite guild application commands', () async {
      final (success, failure) = await api.applicationCommands
          .bulkOverwriteGuildApplicationCommands(guildId, commands: commands);
      final newCommands = success!.data;
      expect(newCommands.map((e) => e.name), contains('test_name'));
    });

    test('Delete guild application command', () async {
      final (success, failure) =
          await api.applicationCommands.deleteGuildApplicationCommand(
        guildId,
        commandId: command.id!,
      );
      expect(failure, isNull);
    });

    test(
      'Delete all guild commands',
      () async {
        final guildId = credentials.guildId;

        final (success, failure) =
            await api.applicationCommands.bulkOverwriteGuildApplicationCommands(
          guildId,
          commands: [],
        );

        expect(failure, isNull);
      },
      skip: 'This test only runs manually',
    );
  });

  group('Guild command permissions:', () {
    final guildId = credentials.guildId;
    final roleId = credentials.roleId;
    late final ApplicationCommand command;

    setUpAll(() async {
      final (success, failure) =
          await api.applicationCommands.createGuildApplicationCommand(
        guildId,
        name: 'test_name',
        description: 'test description',
      );
      command = success!.data;
    });

    test('Edit application command permissions', () async {
      final (success, failure) =
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
      final permissions = success!.data;
      expect(permissions.permissions.length, 1);
    });

    test('Get guild application command permissions', () async {
      final (success, failure) =
          await api.applicationCommands.getGuildApplicationCommandPermissions(
        guildId,
      );
      final guildPermissions = success!.data;
      expect(guildPermissions.length, 1);
    });

    test('Get application command permissions', () async {
      final (success, failure) =
          await api.applicationCommands.getApplicationCommandPermissions(
        guildId,
        commandId: command.id!,
      );
      final fetchedPermissions = success!.data;
      expect(fetchedPermissions.permissions.length, 1);
    });

    test('Batch edit application command permissions', () async {
      final (success, failure) =
          await api.applicationCommands.batchEditApplicationCommandPermissions(
        guildId,
        permissions: [],
      );
      final batchPermissions = success!.data;
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
