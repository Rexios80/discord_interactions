// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_utils.dart';

//* NOTE: These tests will take a long time to run
void main() async {
  await setup();

  final channelId = credentials.channelId;

  // TODO: getChannel

  // These tests must be run in the written order to pass
  group('Messaging:', () {
    late final String messageId;

    test('Create message', () async {
      final message = Message(content: 'This is a test');

      final response = await api.channels.createMessage(
        channelId,
        message: message,
      );
      final responseMessage = response.data!;
      messageId = responseMessage.id!;

      expect(responseMessage.content, message.content);
      await avoidRateLimit();
    });

    test('Get channel message', () async {
      final response =
          await api.channels.getChannelMessage(channelId, messageId: messageId);
      final responseMessage = response.data!;

      expect(responseMessage.content, 'This is a test');
      await avoidRateLimit();
    });

    test('Edit message', () async {
      final response = await api.channels.editMessage(
        channelId,
        messageId: messageId,
        message: Message(content: 'This is an edited test'),
      );
      final responseMessage = response.data!;
      expect(responseMessage.content, 'This is an edited test');
      await avoidRateLimit();
    });

    test('Create reaction', () async {
      final response = await api.channels.createReaction(
        channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Get reactions', () async {
      final response = await api.channels.getReactions(
        channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      final responseReactions = response.data!;

      expect(responseReactions.length, 1);
      await avoidRateLimit();
    });

    test('Delete own reaction', () async {
      final response = await api.channels.deleteOwnReaction(
        channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete user reaction', () async {
      final response = await api.channels.deleteUserReaction(
        channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
        userId: credentials.userId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete all reactions for emoji', () async {
      final response = await api.channels.deleteAllReactionsForEmoji(
        channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete all reactions', () async {
      final response = await api.channels.deleteAllReactions(
        channelId,
        messageId: messageId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete message', () async {
      final response = await api.channels.deleteMessage(
        channelId,
        messageId: messageId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('File upload', () async {
      final testFile = File('test_resources/test_file.gif');
      final testFileBytes = await testFile.readAsBytes();
      final multipartFile = MultipartFile.fromBytes(
        testFileBytes,
        filename: 'test_file.gif',
      );

      final attachment = Attachment(
        id: '0',
        filename: 'test_file.gif',
      );

      final response = await api.channels.createMessage(
        channelId,
        message: Message(attachments: [attachment]),
        files: [multipartFile],
      );

      expect(response.data!.attachments!.length, 1);
      await avoidRateLimit();
    });
  });
}
