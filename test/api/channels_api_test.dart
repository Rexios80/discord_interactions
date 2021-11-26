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

  // These tests must be run in the written order to pass
  group('Messaging:', () {
    late final String messageId;
    late final String fileUploadMessageId;

    test('Create message', () async {
      final message = Message(content: 'This is a test');

      final response = await api.channels.createMessage(
        credentials.channelId,
        message: message,
      );
      final responseMessage = response.data!;
      messageId = responseMessage.id!;

      expect(responseMessage.content, message.content);
      await avoidRateLimit();
    });

    test('Get channel message', () async {
      final response = await api.channels
          .getChannelMessage(credentials.channelId, messageId: messageId);
      final responseMessage = response.data!;

      expect(responseMessage.content, 'This is a test');
      await avoidRateLimit();
    });

    test('Get channel messages', () async {
      final response =
          await api.channels.getChannelMessages(credentials.channelId);
      expect(response.data!.length, greaterThan(0));
      await avoidRateLimit();
    });

    test('Edit message', () async {
      final response = await api.channels.editMessage(
        credentials.channelId,
        messageId: messageId,
        message: Message(content: 'This is an edited test'),
      );
      final responseMessage = response.data!;
      expect(responseMessage.content, 'This is an edited test');
      await avoidRateLimit();
    });

    test('Create reaction', () async {
      final response = await api.channels.createReaction(
        credentials.channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Get reactions', () async {
      final response = await api.channels.getReactions(
        credentials.channelId,
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
        credentials.channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete user reaction', () async {
      final response = await api.channels.deleteUserReaction(
        credentials.channelId,
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
        credentials.channelId,
        messageId: messageId,
        emojiName: credentials.emojiName,
        emojiId: credentials.emojiId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete all reactions', () async {
      final response = await api.channels.deleteAllReactions(
        credentials.channelId,
        messageId: messageId,
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });

    test('Delete message', () async {
      final response = await api.channels.deleteMessage(
        credentials.channelId,
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
        credentials.channelId,
        message: Message(attachments: [attachment]),
        files: [multipartFile],
      );
      fileUploadMessageId = response.data!.id!;

      expect(response.data!.attachments!.length, 1);
      await avoidRateLimit();
    });

    test('Bulk delete messages', () async {
      final newMessageResponse = await api.channels.createMessage(
        credentials.channelId,
        message: Message(content: 'Delete me'),
      );
      final newMessageId = newMessageResponse.data!.id!;

      await avoidRateLimit();

      final response = await api.channels.bulkDeleteMessages(
        credentials.channelId,
        messageIds: [fileUploadMessageId, newMessageId],
        reason: 'Testing reasons',
      );
      expect(response.error, isNull);
      await avoidRateLimit();
    });
  });

  // These tests must be run in the written order to pass
  group('Channel operations:', () {
    late final String channelId;
    late final String inviteCode;
    late final String messageId;

    group('Channel:', () {
      test('Create channel', () async {
        // TODO: Need the Guilds API for this
        channelId = credentials.channelId;
        await avoidRateLimit();
      });

      test('Get channel', () async {
        final response = await api.channels.getChannel(channelId);
        final responseChannel = response.data!;

        expect(responseChannel.id, channelId);
        await avoidRateLimit();
      });

      test('Modify channel', () async {
        final response = await api.channels.modifyChannel(
          Channel(
            id: channelId,
            name: 'test_channel_modified',
            type: ChannelType.guildText,
          ),
          reason: 'Testing reasons',
        );
        final responseChannel = response.data!;

        expect(responseChannel.name, 'test_channel_modified');
        await avoidRateLimit();
      });

      test('Edit channel permissions', () async {
        final response = await api.channels.editChannelPermissions(
          channelId,
          overwrite: PermissionOverwrite(
            id: credentials.roleId,
            type: PermissionOverwriteType.role,
            allow: [Permission.sendMessages],
            deny: [],
          ),
          reason: 'Testing reasons',
        );
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Delete channel permission', () async {
        final response = await api.channels.deleteChannelPermission(
          channelId,
          overwriteId: credentials.roleId,
          reason: 'Testing reasons',
        );
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Create channel invite', () async {
        final response = await api.channels.createChannelInvite(channelId);
        final invite = response.data!;
        inviteCode = invite.code;
        expect(invite, isNotNull);
        await avoidRateLimit();
      });

      test('Get channel invites', () async {
        final response = await api.channels.getChannelInvites(channelId);
        expect(response.data!.length, greaterThan(0));
        await avoidRateLimit();
      });

      // It's kind of dumb that these are in the channels testing,
      // but that's how the API works I guess
      group('Invites:', () {
        test('Get invite', () async {
          final response = await api.invites.getInvite(inviteCode);
          expect(response.data!.code, inviteCode);
          await avoidRateLimit();
        });

        test('Delete invite', () async {
          final response = await api.invites.deleteInvite(inviteCode);
          expect(response.error, isNull);
          await avoidRateLimit();
        });
      });

      test('Trigger typing indicator', () async {
        final response = await api.channels.triggerTypingIndicator(channelId);
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Pin message', () async {
        final createMessageResponse = await api.channels.createMessage(
          channelId,
          message: Message(content: 'Test message'),
        );
        messageId = createMessageResponse.data!.id!;
        await avoidRateLimit();

        final response = await api.channels.pinMessage(
          channelId,
          messageId: messageId,
        );
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Get pinned messages', () async {
        final response = await api.channels.getPinnedMessages(channelId);
        expect(response.data!.length, greaterThan(0));
        await avoidRateLimit();
      });

      test('Unpin message', () async {
        final response = await api.channels.unpinMessage(
          channelId,
          messageId: messageId,
          reason: 'Testing reasons',
        );
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Delete channel', () async {
        // TODO: Need to create a channel with the GuildsAPI first to delete it
      });
    });

    group('Thread:', () {
      late final String threadId;
      late final String threadId2;

      test('Start thread with message', () async {
        final response = await api.channels.startThreadWithMessage(
          channelId,
          messageId: messageId,
          name: 'test_thread',
        );
        threadId = response.data!.id!;
        expect(response.data!.name, 'test_thread');
        await avoidRateLimit();
      });

      test('Start thread without message', () async {
        final startThreadResponse =
            await api.channels.startThreadWithoutMessage(
          channelId,
          name: 'test_thread_2',
          type: ChannelType.guildPublicThread,
        );
        threadId2 = startThreadResponse.data!.id!;
        expect(startThreadResponse.data!.name, 'test_thread_2');
        await avoidRateLimit();
      });

      test('List active threads', () async {
        // TODO: Need the Guilds API to list active threads
        await avoidRateLimit();
      });

      test('Add thread member', () async {
        final response = await api.channels.addThreadMember(
          threadId,
          userId: credentials.userId,
        );
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Get thread member', () async {
        final response = await api.channels.getThreadMember(
          threadId,
          userId: credentials.userId,
        );
        expect(response.data, isNotNull);
        await avoidRateLimit();
      });

      test('List thread members', () async {
        final response = await api.channels.listThreadMembers(threadId);
        expect(response.data!.length, greaterThan(0));
        await avoidRateLimit();
      });

      test('Remove thread member', () async {
        final response = await api.channels.removeThreadMember(
          threadId,
          userId: credentials.userId,
        );
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Leave thread', () async {
        final response = await api.channels.leaveThread(threadId);
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Join thread', () async {
        final response = await api.channels.joinThread(threadId);
        expect(response.error, isNull);
        await avoidRateLimit();
      });

      test('Modify thread', () async {
        final response = await api.channels.modifyThread(
          threadId,
          name: 'test_thread_modified',
          metadata: ThreadMetadata(archived: true),
          reason: 'Testing reasons',
        );
        final responseThread = response.data!;

        expect(responseThread.name, 'test_thread_modified');
        await avoidRateLimit();
      });

      test('List public archived threads', () async {
        final response =
            await api.channels.listPublicArchivedThreads(channelId);
        final responseThreads = response.data!;
        expect(responseThreads.threads.length, 1);
        await avoidRateLimit();
      });

      test('Delete threads', () async {
        final response = await api.channels.deleteChannel(
          threadId,
          reason: 'Testing reasons',
        );
        expect(response.error, isNull);
        await avoidRateLimit();

        final response2 = await api.channels.deleteChannel(threadId2);
        expect(response2.error, isNull);
        await avoidRateLimit();
      });
    });
  });
}
