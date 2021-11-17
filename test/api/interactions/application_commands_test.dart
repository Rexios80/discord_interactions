import 'package:discord_interactions/discord_interactions.dart';
import 'package:test/test.dart';

import '../../test_setup.dart';

void main() async {
  final api = await createDiscordApi();

  group('Global commands:', () {
    test('createGlobalApplicationCommand', () async {
      final command =
          await api.applicationCommands.createGlobalApplicationCommand(
        ApplicationCommand(
          name: 'test_name',
          description: 'test description',
        ),
      );
      expect(command.name, 'test_name');
      expect(command.description, 'test description');
    });

    test('getGlobalApplicationCommands', () async {
      final commands =
          await api.applicationCommands.getGlobalApplicationCommands();
      expect(commands.length, greaterThan(0));
      expect(commands[0].name, 'test_name');
    });

    test('deleteAllCommands', () async {
      await api.applicationCommands.bulkOverwriteGlobalApplicationCommands([]);
    });
  });
}
