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
      final response = await api.channels.createMessage(
        credentials.channelId,
        content: 'This is a test',
      );
      final responseMessage = response.data!;
      messageId = responseMessage.id;

      expect(responseMessage.content, 'This is a test');
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
        content: 'This is an edited test',
      );
      final responseMessage = response.data!;
      expect(responseMessage.content, 'This is an edited test');
      await avoidRateLimit();
    });

    group('Reactions:', () {
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
        attachments: [attachment],
        files: [multipartFile],
      );
      fileUploadMessageId = response.data!.id;

      expect(response.data!.attachments.length, 1);
      await avoidRateLimit();
    });

    test('Bulk delete messages', () async {
      final newMessageResponse = await api.channels.createMessage(
        credentials.channelId,
        content: 'Delete me',
      );
      final newMessageId = newMessageResponse.data!.id;

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
    group('Channel:', () {
      late final String channelId;

      test('Create channel', () async {
        final response = await api.guilds
            .createGuildChannel(credentials.guildId, name: 'test_channel');
        expect(response.error, isNull);
        channelId = response.data!.id;
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
          channelId,
          name: 'test_channel_modified',
          type: ChannelType.guildText,
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

      group('Invites:', () {
        late final String inviteCode;

        test('Create channel invite', () async {
          final response =
              await api.channels.createChannelInvite(credentials.channelId);
          final invite = response.data!;
          inviteCode = invite.code!;
          expect(invite, isNotNull);
          await avoidRateLimit();
        });

        test('Get channel invites', () async {
          final response =
              await api.channels.getChannelInvites(credentials.channelId);
          expect(response.data!.length, greaterThan(0));
          await avoidRateLimit();
        });

        test('Get guild invites', () async {
          final response =
              await api.guilds.getGuildInvites(credentials.guildId);
          expect(response.data!.length, greaterThan(0));
          await avoidRateLimit();
        });

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

      group('Message pinning:', () {
        late final String messageId;

        test('Pin message', () async {
          final createMessageResponse = await api.channels.createMessage(
            channelId,
            content: 'Test message',
          );
          messageId = createMessageResponse.data!.id;
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
      });

      test('Delete channel', () async {
        final response = await api.channels.deleteChannel(channelId);
        expect(response.error, isNull);
        await avoidRateLimit();
      });
    });

    group('Thread:', () {
      late final String messageId;
      late final String threadId;
      late final String threadId2;

      test('Start thread with message', () async {
        final createMessageResponse = await api.channels.createMessage(
          credentials.channelId,
          content: 'Test message',
        );

        messageId = createMessageResponse.data!.id;

        await avoidRateLimit();

        final response = await api.channels.startThreadWithMessage(
          credentials.channelId,
          messageId: messageId,
          name: 'test_thread',
        );
        threadId = response.data!.id;
        expect(response.data!.name, 'test_thread');
        await avoidRateLimit();
      });

      test('Start thread without message', () async {
        final response = await api.channels.startThreadWithoutMessage(
          credentials.channelId,
          name: 'test_thread_2',
          type: ChannelType.guildPublicThread,
        );
        threadId2 = response.data!.id;
        expect(response.data!.name, 'test_thread_2');
        await avoidRateLimit();
      });

      test('List active threads', () async {
        final response =
            await api.guilds.listActiveThreads(credentials.guildId);
        expect(response.error, isNull);
        expect(response.data?.threads.length, greaterThan(0));
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
          archived: true,
          reason: 'Testing reasons',
        );
        final responseThread = response.data!;

        expect(responseThread.name, 'test_thread_modified');
        await avoidRateLimit();
      });

      test('List public archived threads', () async {
        final response =
            await api.channels.listPublicArchivedThreads(credentials.channelId);
        final responseThreads = response.data!;
        expect(responseThreads.threads.length, greaterThan(0));
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
