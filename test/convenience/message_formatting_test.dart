// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_config.dart';

void main() async {
  await setup();

  test('Message formatting', () async {
    final userId = applicationInfo['userId'];
    final channelId = applicationInfo['channelId'];
    final roleId = applicationInfo['roleId'];
    final emojiName = applicationInfo['emojiName'];
    final emojiId = applicationInfo['emojiId'];
    final timestamp = DateTime.now();

    var content = MessageFormatting.user(userId);
    content += '\n' + MessageFormatting.userNickname(userId);
    content += '\n' + MessageFormatting.channel(channelId);
    content += '\n' + MessageFormatting.role(roleId);
    content += '\n' + MessageFormatting.emoji(emojiName, emojiId);
    content += '\n' + MessageFormatting.emojiAnimated(emojiName, emojiId);
    content += '\n' + MessageFormatting.timestamp(timestamp);

    for (final style in TimestampStyle.values) {
      content += '\n' + MessageFormatting.timestampStyled(timestamp, style);
    }

    final message = Message(
      content: content,
    );

    final createMessageResponse = await api.channels.createMessage(
      channelId,
      message: message,
    );

    expect(createMessageResponse.data!.content, message.content);
  });
}
