@Skip('Requires test server and user input')

// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:test/test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../../test_utils.dart';

/// See https://github.com/Rexios80/discord_interactions_test for setup information
void main() async {
  await setup();

  final client = InteractionsTestServerClient();
  late final ApplicationCommand testCommand;
  late final ApplicationCommand autocompleteCommand;
  late final ApplicationCommand messageCommand;
  late final ApplicationCommand userCommand;

  setUpAll(() async {
    // Create the test command
    final response =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      name: 'test',
      description: 'test command',
    );

    testCommand = response.success!.data;

    final response2 =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      name: 'autocomplete',
      description: 'test autocomplete',
      options: [
        ApplicationCommandOption(
          type: ApplicationCommandOptionType.string,
          name: 'string',
          description: 'string option',
          required: true,
          autocomplete: true,
        ),
      ],
    );

    autocompleteCommand = response2.success!.data;

    final response3 =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      type: ApplicationCommandType.message,
      name: 'test message command',
    );

    messageCommand = response3.success!.data;

    final response4 =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      type: ApplicationCommandType.user,
      name: 'test user command',
    );

    userCommand = response4.success!.data;
  });

  // These tests must be run in the written order to pass
  group('Interaction responses:', () {
    late final Interaction interaction;

    test('Create interaction response', () async {
      print('Invoke /${testCommand.name} in your test server');
      interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      final response = await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(content: 'Test response'),
      );
      expect(response.failure, isNull);

      client.notifyInteractionHandled();
    });

    test('Get original interaction response', () async {
      final response = await api.interactions
          .getOriginalInteractionResponse(interaction.token);
      expect(
        response.success?.data.content,
        'Test response',
      );
      await avoidRateLimit();
    });

    test('Edit original interaction response', () async {
      final response = await api.interactions.editOriginalInteractionResponse(
        interaction.token,
        content: 'Edited response',
      );
      expect(
        response.success?.data.content,
        'Edited response',
      );
      await avoidRateLimit();
    });

    test('Delete original interaction response', () async {
      final response = await api.interactions
          .deleteOriginalInteractionResponse(interaction.token);
      expect(response.failure, isNull);
      await avoidRateLimit();
    });

    late final Message followupMessage;

    test('Create followup message', () async {
      final response = await api.interactions.createFollowupMessage(
        interaction.token,
        content: 'Test followup message',
      );

      followupMessage = response.success!.data;
      expect(followupMessage.content, 'Test followup message');
      await avoidRateLimit();
    });

    test('Get followup message', () async {
      final response = await api.interactions.getFollowupMessage(
        interaction.token,
        messageId: followupMessage.id,
      );
      expect(response.success?.data.content, 'Test followup message');
      await avoidRateLimit();
    });

    test('Edit followup message', () async {
      final response = await api.interactions.editFollowupMessage(
        interaction.token,
        messageId: followupMessage.id,
        content: 'Edited followup message',
      );
      expect(
        response.success?.data.content,
        'Edited followup message',
      );
      await avoidRateLimit();
    });

    test('Delete followup message', () async {
      final response = await api.interactions.deleteFollowupMessage(
        interaction.token,
        messageId: followupMessage.id,
      );
      expect(response.failure, isNull);
    });
  });

  group('Message components:', () {
    test('Button', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      // Respond to the interaction
      final createInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(
          content: 'Test response',
          components: [
            Component(
              type: ComponentType.actionRow,
              components: [
                Component(
                  type: ComponentType.button,
                  customId: 'buttonId',
                  label: 'Click me',
                  style: ButtonStyle.danger,
                ),
              ],
            ),
          ],
        ),
      );
      expect(createInteractionResponseResponse.failure, isNull);

      client.notifyInteractionHandled();

      print('Click the button');
      final buttonInteraction = await client.waitForInteraction();
      expect(buttonInteraction.data?.customId, 'buttonId');
      expect(buttonInteraction.message?.interaction?.name, testCommand.name);

      final buttonInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        buttonInteraction.id,
        token: buttonInteraction.token,
        response: InteractionResponse.message(
          type: InteractionCallbackType.updateMessage,
          content: 'Button clicked',
          // Send an empty list of components to remove them
          components: [],
        ),
      );
      expect(buttonInteractionResponseResponse.failure, isNull);

      client.notifyInteractionHandled();
    });

    test('URL button', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      // Respond to the interaction
      final createInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(
          content: 'Test response',
          components: [
            Component(
              type: ComponentType.actionRow,
              components: [
                Component(
                  type: ComponentType.button,
                  url: 'https://discord.com',
                  label: 'Click me',
                  style: ButtonStyle.link,
                ),
              ],
            ),
          ],
        ),
      );
      expect(createInteractionResponseResponse.failure, isNull);

      client.notifyInteractionHandled();
    });

    test('Select menu', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      final selectOptionValues = ['option1', 'option2', 'option3'];

      // Respond to the interaction
      final createInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(
          content: 'Make a selection',
          components: [
            Component(
              type: ComponentType.actionRow,
              components: [
                Component(
                  type: ComponentType.selectMenu,
                  customId: 'selectMenuId',
                  minValues: 1,
                  maxValues: 3,
                  options: [
                    SelectOption(
                      label: 'Option 1',
                      value: selectOptionValues[0],
                    ),
                    SelectOption(
                      label: 'Option 2',
                      value: selectOptionValues[1],
                    ),
                    SelectOption(
                      label: 'Option 3',
                      value: selectOptionValues[2],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
      expect(createInteractionResponseResponse.failure, isNull);

      client.notifyInteractionHandled();

      print('Make your selection');
      final buttonInteraction = await client.waitForInteraction();
      final selectedValues = buttonInteraction.data?.values;
      expect(buttonInteraction.data?.customId, 'selectMenuId');
      expect(
        selectedValues!.any(selectOptionValues.contains),
        true,
      );

      final buttonInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        buttonInteraction.id,
        token: buttonInteraction.token,
        response: InteractionResponse.message(
          type: InteractionCallbackType.updateMessage,
          content: 'Selection made: $selectedValues',
          // Send an empty list of components to remove them
          components: [],
        ),
      );
      expect(buttonInteractionResponseResponse.failure, isNull);

      client.notifyInteractionHandled();
    });
  });

  test(
    'Autocomplete',
    () async {
      print('Invoke /${autocompleteCommand.name} in your test server');
      final autocompleteInteraction = await client.waitForInteraction();
      expect(autocompleteInteraction.data?.name, autocompleteCommand.name);
      expect(
        autocompleteInteraction.type,
        InteractionType.applicationCommandAutocomplete,
      );

      final response = await api.interactions.createInteractionResponse(
        autocompleteInteraction.id,
        token: autocompleteInteraction.token,
        response: InteractionResponse.autocomplete([
          ApplicationCommandOptionChoice(name: 'test', value: 'test'),
        ]),
      );
      expect(response.failure, isNull);

      client.notifyInteractionHandled();

      final interaction = await client.waitForInteraction();
      expect(interaction.data?.options!.first.value, 'test');

      final response2 = await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(content: 'It worked'),
      );
      expect(response2.failure, isNull);

      client.notifyInteractionHandled();
    },
    skip: 'Discord is sending two autocomplete interactions for some reason',
  );

  test('Message command', () async {
    print('Invoke "${messageCommand.name}" in your test server');
    final interaction = await client.waitForInteraction();
    expect(interaction.data?.name, messageCommand.name);

    final messageId = interaction.data!.targetId!;

    final response = await api.interactions.createInteractionResponse(
      interaction.id,
      token: interaction.token,
      response: InteractionResponse.message(
        content: 'Message id: $messageId',
      ),
    );
    expect(response.failure, isNull);

    client.notifyInteractionHandled();
  });

  test('User command', () async {
    print('Invoke "${userCommand.name}" in your test server');
    final interaction = await client.waitForInteraction();
    expect(interaction.data?.name, userCommand.name);

    final userId = interaction.data!.targetId!;

    final response = await api.interactions.createInteractionResponse(
      interaction.id,
      token: interaction.token,
      response: InteractionResponse.message(
        content: 'User id: $userId',
      ),
    );
    expect(response.failure, isNull);

    client.notifyInteractionHandled();
  });

  tearDownAll(() async {
    client.close();

    // Delete the test commands
    await api.applicationCommands.bulkOverwriteGuildApplicationCommands(
      credentials.guildId,
      commands: [],
    );
  });
}

class InteractionsTestServerClient {
  // Connect to the test server
  final _socket =
      WebSocketChannel.connect(Uri.parse(credentials.interactionsRouterUrl));

  late final Stream _socketStream;

  InteractionsTestServerClient() {
    // Convert socket.stream to a boradcast stream
    final socketStreamController = StreamController.broadcast();
    _socket.stream.listen(socketStreamController.add);
    _socketStream = socketStreamController.stream;
  }

  /// Wait for the tester to invoke an interaction
  Future<Interaction> waitForInteraction() async {
    final json = await _socketStream.first;
    return Interaction.fromJson(jsonDecode(json));
  }

  /// Notify the test server the Interaction was handled
  void notifyInteractionHandled() {
    _socket.sink.add(null);
  }

  /// Close the connection to the test server so it can die
  void close() {
    _socket.sink.close();
  }
}
