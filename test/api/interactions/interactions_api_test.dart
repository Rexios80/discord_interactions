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

  setUpAll(() async {
    // Create the test command
    final response =
        await api.applicationCommands.createGuildApplicationCommand(
      ApplicationCommand(name: 'test', description: 'test command'),
      guildId: credentials.guildId,
    );

    testCommand = response.data!;
  });

  group('Interaction responses:', () {
    late final Interaction interaction;

    test('Create interaction response', () async {
      print('Invoke /${testCommand.name} in your test server');
      interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      final response = await api.interactions.createInteractionResponse(
        interaction: interaction,
        response: InteractionResponse.withData(content: 'Test response'),
      );
      expect(response.error, isNull);

      client.notifyInteractionHandled();
    });

    test('Get original interaction response', () async {
      final response = await api.interactions
          .getOriginalInteractionResponse(interaction.token);
      expect(
        response.data?.content,
        'Test response',
      );
      await avoidRateLimit();
    });

    test('Edit original interaction response', () async {
      final response = await api.interactions.editOriginalInteractionResponse(
        interactionToken: interaction.token,
        message: Message(content: 'Edited response'),
      );
      expect(
        response.data?.content,
        'Edited response',
      );
      await avoidRateLimit();
    });

    test('Delete original interaction response', () async {
      final response = await api.interactions
          .deleteOriginalInteractionResponse(interaction.token);
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    late final Message followupMessage;

    test('Create followup message', () async {
      final response = await api.interactions.createFollowupMessage(
        interactionToken: interaction.token,
        message: Message(content: 'Test followup message'),
      );

      followupMessage = response.data!;
      expect(followupMessage.content, 'Test followup message');
      await avoidRateLimit();
    });

    test('Get followup message', () async {
      final response = await api.interactions.getFollowupMessage(
        interactionToken: interaction.token,
        messageId: followupMessage.id!,
      );
      expect(response.data?.content, 'Test followup message');
      await avoidRateLimit();
    });

    test('Edit followup message', () async {
      final response = await api.interactions.editFollowupMessage(
        interactionToken: interaction.token,
        messageId: followupMessage.id!,
        message: Message(content: 'Edited followup message'),
      );
      expect(
        response.data?.content,
        'Edited followup message',
      );
      await avoidRateLimit();
    });

    test('Delete followup message', () async {
      final response = await api.interactions.deleteFollowupMessage(
        interactionToken: interaction.token,
        messageId: followupMessage.id!,
      );
      expect(response.error, isNull);
    });
  });

  group('Message components:', () {
    test('Button component', () async {
      print('Invoke /${testCommand.name} in your test server');
      final interaction = await client.waitForInteraction();
      expect(interaction.data?.name, testCommand.name);

      // Respond to the interaction
      final createInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        interaction: interaction,
        response: InteractionResponse.withData(
          content: 'Test response',
          components: [
            Component(
              type: ComponentType.actionRow,
              components: [
                Component(
                  customId: 'buttonId',
                  label: 'Click me',
                  type: ComponentType.button,
                  style: ButtonStyle.danger,
                ),
              ],
            )
          ],
        ),
      );
      expect(createInteractionResponseResponse.error, isNull);

      client.notifyInteractionHandled();

      print('Click the button');
      final buttonInteraction = await client.waitForInteraction();
      expect(buttonInteraction.data?.customId, 'buttonId');
      expect(buttonInteraction.message?.interaction?.name, testCommand.name);

      final buttonInteractionResponseResponse =
          await api.interactions.createInteractionResponse(
        interaction: buttonInteraction,
        response: InteractionResponse.withData(
          type: InteractionCallbackType.updateMessage,
          content: 'Button clicked',
          // Send an empty list of components to remove them
          components: [],
        ),
      );
      expect(buttonInteractionResponseResponse.error, isNull);

      client.notifyInteractionHandled();
    });
  });

  tearDownAll(() async {
    client.close();

    // Delete the test command
    await api.applicationCommands.deleteGuildApplicationCommand(
      testCommand.id!,
      guildId: credentials.guildId,
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
