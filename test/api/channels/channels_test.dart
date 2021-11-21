import 'dart:io';

import 'package:dio/dio.dart';
import 'package:discord_interactions/discord_interactions.dart';
import 'package:test/test.dart';
import 'package:http_parser/http_parser.dart';

import '../../test_config.dart';

void main() async {
  await setup();

  group('Channel:', () {
    final channelId = applicationInfo['channelId'];

    test('Basic messaging actions', () async {
      final message = Message(content: 'Hello world');

      final createMessageResponse = await api.channels.createMessage(
        channelId,
        message: message,
      );

      expect(createMessageResponse.data!.content, message.content);
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

      final createMessageResponse = await api.channels.createMessage(
        channelId,
        message: Message(
          attachments: [attachment],
        ),
        files: [multipartFile],
      );

      expect(createMessageResponse.data!.attachments!.length, 1);
    });
  });
}
