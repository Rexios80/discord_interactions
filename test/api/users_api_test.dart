// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_utils.dart';

void main() async {
  await setup();

  test('Get current user', () async {
    final (success, failure) = await api.users.getCurrentUser();
    expect(failure, isNull);
  });

  test('Get user', () async {
    final (success, failure) = await api.users.getUser(credentials.userId);

    expect(success, isNotNull);
  });

  test('Modify current user', () async {
    final avatarFile = File(path.join('test_resources', 'test_avatar.png'));
    final avatarBytes = await avatarFile.readAsBytes();
    final avatarBase64 = base64Encode(avatarBytes);
    final avatarImageData = ImageData.fromBase64(avatarBase64, ImageFormat.png);

    final (success, failure) = await api.users.modifyCurrentUser(
      username: 'discord_interactions_test',
      avatarImageData: avatarImageData,
    );
    expect(failure, isNull);
  });

  test('Get current user guilds', () async {
    final (success, failure) = await api.users.getCurrentUserGuilds();
    expect(failure, isNull);

    await avoidRateLimit();

    final (success2, failure2) = await api.users.getCurrentUserGuilds(limit: 1);
    expect(failure2, isNull);
    expect(success2, hasLength(1));
  });

  test('Create DM', () async {
    final (success, failure) = await api.users.createDm(credentials.userId);
    expect(failure, isNull);
  });
}
