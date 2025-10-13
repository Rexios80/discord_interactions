@Skip('Requires test server and user input')
library;

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
    final (success, failure) =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      name: 'test',
      description: 'test command',
    );

    testCommand = success!.data;

    final (success2, failure2) =
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

    autocompleteCommand = success2!.data;

    final (success3, failure3) =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      type: ApplicationCommandType.message,
      name: 'test message command',
    );

    messageCommand = success3!.data;

    final (success4, failure4) =
        await api.applicationCommands.createGuildApplicationCommand(
      credentials.guildId,
      type: ApplicationCommandType.user,
      name: 'test user command',
    );

    userCommand = success4!.data;
  });

  // These tests must be run in the written order to pass
  group('Interaction responses:', () {
    late final Interaction interaction;

    test('Create interaction response', () async {
      print('Invoke /${testCommand.name} in your test server');
      interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      final (success, failure) =
          await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(content: 'Test response'),
      );
      expect(failure, isNull);

      client.notifyInteractionHandled();
    });

    test('Get original interaction response', () async {
      final (success, failure) = await api.interactions
          .getOriginalInteractionResponse(interaction.token);
      expect(
        success?.data.content,
        'Test response',
      );
      await avoidRateLimit();
    });

    test('Edit original interaction response', () async {
      final (success, failure) =
          await api.interactions.editOriginalInteractionResponse(
        interaction.token,
        content: 'Edited response',
      );
      expect(
        success?.data.content,
        'Edited response',
      );
      await avoidRateLimit();
    });

    test('Delete original interaction response', () async {
      final (success, failure) = await api.interactions
          .deleteOriginalInteractionResponse(interaction.token);
      expect(failure, isNull);
      await avoidRateLimit();
    });

    late final Message followupMessage;

    test('Create followup message', () async {
      final (success, failure) = await api.interactions.createFollowupMessage(
        interaction.token,
        content: 'Test followup message',
      );

      followupMessage = success!.data;
      expect(followupMessage.content, 'Test followup message');
      await avoidRateLimit();
    });

    test('Get followup message', () async {
      final (success, failure) = await api.interactions.getFollowupMessage(
        interaction.token,
        messageId: followupMessage.id,
      );
      expect(success?.data.content, 'Test followup message');
      await avoidRateLimit();
    });

    test('Edit followup message', () async {
      final (success, failure) = await api.interactions.editFollowupMessage(
        interaction.token,
        messageId: followupMessage.id,
        content: 'Edited followup message',
      );
      expect(
        success?.data.content,
        'Edited followup message',
      );
      await avoidRateLimit();
    });

    test('Delete followup message', () async {
      final (success, failure) = await api.interactions.deleteFollowupMessage(
        interaction.token,
        messageId: followupMessage.id,
      );
      expect(failure, isNull);
    });
  });

  group('Message components:', () {
    test('Button', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      // Respond to the interaction
      final (createInteractionSuccess, createInteractionFailure) =
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
      expect(createInteractionFailure, isNull);

      client.notifyInteractionHandled();

      print('Click the button');
      final buttonInteraction = await client.waitForInteraction();
      expect(buttonInteraction.data?.customId, 'buttonId');
      expect(buttonInteraction.message?.interaction?.name, testCommand.name);

      final (buttonInteractionSuccess, buttonInteractionFailure) =
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
      expect(buttonInteractionFailure, isNull);

      client.notifyInteractionHandled();
    });

    test('URL button', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      // Respond to the interaction
      final (createInteractionSuccess2, createInteractionFailure2) =
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
      expect(createInteractionFailure2, isNull);

      client.notifyInteractionHandled();
    });

    test('Select menu', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      final selectOptionValues = ['option1', 'option2', 'option3'];

      // Respond to the interaction
      final (createInteractionSuccess3, createInteractionFailure3) =
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
      expect(createInteractionFailure3, isNull);

      client.notifyInteractionHandled();

      print('Make your selection');
      final buttonInteraction = await client.waitForInteraction();
      final selectedValues = buttonInteraction.data?.values;
      expect(buttonInteraction.data?.customId, 'selectMenuId');
      expect(
        selectedValues!.any(selectOptionValues.contains),
        true,
      );

      final (
        buttonInteractionResponseSuccess,
        buttonInteractionResponseFailure
      ) = await api.interactions.createInteractionResponse(
        buttonInteraction.id,
        token: buttonInteraction.token,
        response: InteractionResponse.message(
          type: InteractionCallbackType.updateMessage,
          content: 'Selection made: $selectedValues',
          // Send an empty list of components to remove them
          components: [],
        ),
      );
      expect(buttonInteractionResponseFailure, isNull);

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

      final (autocompleteSuccess, autocompleteFailure) =
          await api.interactions.createInteractionResponse(
        autocompleteInteraction.id,
        token: autocompleteInteraction.token,
        response: InteractionResponse.autocomplete([
          ApplicationCommandOptionChoice(name: 'test', value: 'test'),
        ]),
      );
      expect(autocompleteFailure, isNull);

      client.notifyInteractionHandled();

      final interaction = await client.waitForInteraction();
      expect(interaction.data?.options!.first.value, 'test');

      final (itWorkedSuccess, itWorkedFailure) =
          await api.interactions.createInteractionResponse(
        interaction.id,
        token: interaction.token,
        response: InteractionResponse.message(content: 'It worked'),
      );
      expect(itWorkedFailure, isNull);

      client.notifyInteractionHandled();
    },
    skip: 'Discord is sending two autocomplete interactions for some reason',
  );

  test('Message command', () async {
    print('Invoke "${messageCommand.name}" in your test server');
    final interaction = await client.waitForInteraction();
    expect(interaction.data?.name, messageCommand.name);

    final messageId = interaction.data!.targetId!;

    final (messageSuccess, messageFailure) =
        await api.interactions.createInteractionResponse(
      interaction.id,
      token: interaction.token,
      response: InteractionResponse.message(
        content: 'Message id: $messageId',
      ),
    );
    expect(messageFailure, isNull);

    client.notifyInteractionHandled();
  });

  test('User command', () async {
    print('Invoke "${userCommand.name}" in your test server');
    final interaction = await client.waitForInteraction();
    expect(interaction.data?.name, userCommand.name);

    final userId = interaction.data!.targetId!;

    final (userSuccess, userFailure) =
        await api.interactions.createInteractionResponse(
      interaction.id,
      token: interaction.token,
      response: InteractionResponse.message(
        content: 'User id: $userId',
      ),
    );
    expect(userFailure, isNull);

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
