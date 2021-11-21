import 'package:discord_interactions/discord_interactions.dart';
import 'package:test/test.dart';

import '../../test_config.dart';

void main() async {
  await setup();

  group('Channel message:', () {
    final channelId = applicationInfo['channelId'];

    test('Send message', () async {
      final message = Message(content: 'Hello world');

      final createMessageResponse = await api.channels.createMessage(
        channelId,
        message: message,
      );

      expect(createMessageResponse.data!.content, message.content);
    });
  });
}
