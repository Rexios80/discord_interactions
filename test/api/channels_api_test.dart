// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_setup.dart';

void main() async {
  await setup();

  final channelId = credentials['channelId'];

  // TODO: getChannel

  test('Basic messaging actions', () async {
    final message = Message(content: 'This is a test');

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
      message: Message(attachments: [attachment]),
      files: [multipartFile],
    );

    expect(createMessageResponse.data!.attachments!.length, 1);
  });
}
