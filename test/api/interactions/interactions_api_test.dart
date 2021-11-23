@Skip('Requires test server and user input')

// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:test/test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../../test_setup.dart';

/// See https://github.com/Rexios80/discord_interactions_test for setup information
void main() async {
  await setup();

  // Connect to the test server
  final socket =
      WebSocketChannel.connect(Uri.parse(credentials.interactionsRouterUrl));

  // Convert socket.stream to a boradcast stream
  final socketStreamController = StreamController.broadcast();
  socket.stream.listen(socketStreamController.add);
  final socketStream = socketStreamController.stream;

  test('Interaction response test', () async {
    // Create the test command
    final testCommandResponse =
        await api.applicationCommands.createGuildApplicationCommand(
      ApplicationCommand(name: 'test', description: 'test command'),
      guildId: credentials.guildId,
    );

    final testCommand = testCommandResponse.data!;

    print('Invoke /${testCommand.name} in your test server');

    final json = await socketStream.first;
    final interaction = Interaction.fromJson(jsonDecode(json));

    expect(interaction.data?.name, testCommand.name);

    // Respond to the interaction
    final createInteractionResponseResponse =
        await api.interactions.createInteractionResponse(
      interaction: interaction,
      response: InteractionResponse.withData(content: 'Test response'),
    );

    expect(createInteractionResponseResponse.error, isNull);

    // Notify the test server the Interaction was handled
    socket.sink.add(null);

    // Get the interaction response
    final getOriginalInteractionResponseResponse = await api.interactions
        .getOriginalInteractionResponse(interaction.token);

    await avoidRateLimit();

    expect(
      getOriginalInteractionResponseResponse.data?.content,
      'Test response',
    );

    // Edit the interaction response
    final editOriginalInteractionResponseResponse =
        await api.interactions.editOriginalInteractionResponse(
      interactionToken: interaction.token,
      message: Message(content: 'Edited response'),
    );

    expect(
      editOriginalInteractionResponseResponse.data?.content,
      'Edited response',
    );

    await avoidRateLimit();

    // Delete the interaction response
    final deleteOriginalInteractionResponseResponse = await api.interactions
        .deleteOriginalInteractionResponse(interaction.token);

    expect(deleteOriginalInteractionResponseResponse.error, isNull);

    await avoidRateLimit();

    // Create followup message
    final createFollowupMessageResponse =
        await api.interactions.createFollowupMessage(
      interactionToken: interaction.token,
      message: Message(content: 'Test followup message'),
    );

    final followupMessage = createFollowupMessageResponse.data!;

    expect(followupMessage.content, 'Test followup message');

    await avoidRateLimit();

    // Get followup message
    final getFollowupMessageResponse =
        await api.interactions.getFollowupMessage(
      interactionToken: interaction.token,
      messageId: followupMessage.id!,
    );

    expect(getFollowupMessageResponse.data?.content, 'Test followup message');

    await avoidRateLimit();

    // Edit followup message
    final editFollowupMessageResponse =
        await api.interactions.editFollowupMessage(
      interactionToken: interaction.token,
      messageId: followupMessage.id!,
      message: Message(content: 'Edited followup message'),
    );

    expect(
      editFollowupMessageResponse.data?.content,
      'Edited followup message',
    );

    await avoidRateLimit();

    // Delete followup message
    final deleteFollowupMessageResponse =
        await api.interactions.deleteFollowupMessage(
      interactionToken: interaction.token,
      messageId: followupMessage.id!,
    );

    expect(deleteFollowupMessageResponse.error, isNull);

    // Delete the test command
    await api.applicationCommands.deleteGuildApplicationCommand(
      testCommand.id!,
      guildId: credentials.guildId,
    );
  });

  tearDownAll(() async {
    // Close the connection to the test server so it can die
    await socket.sink.close();
  });
}

/// Helper function to avoid Dicord rate limiting
Future<void> avoidRateLimit() async {
  await Future.delayed(Duration(seconds: 1));
}
