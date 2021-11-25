// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import '../test_utils.dart';

void main() async {
  await setup();

  test('Get current user', () async {
    final response = await api.users.getCurrentUser();
    expect(response.error, isNull);
  });

  test('Get user', () async {
    final getUserResponse = await api.users.getUser(credentials.userId);

    expect(getUserResponse.data, isNotNull);
  });

  test('Modify current user', () async {
    final avatarFile = File('test_resources/test_avatar.png');
    final avatarBytes = await avatarFile.readAsBytes();
    final avatarBase64 = base64Encode(avatarBytes);
    final avatarImageData = ImageData.fromBase64(avatarBase64, ImageFormat.png);

    final response = await api.users.modifyCurrentUser(
      username: 'discord_interactions_test',
      avatarImageData: avatarImageData,
    );

    expect(response.error, isNull);
  });

  test('Get current user guilds', () async {
    final response = await api.users.getCurrentUserGuilds();
    expect(response.error, isNull);

    await avoidRateLimit();

    final response2 = await api.users.getCurrentUserGuilds(limit: 1);
    expect(response2.error, isNull);
    expect(response2.data, hasLength(1));
  });

  test('Create DM', () async {
    final response = await api.users.createDm(credentials.userId);
    expect(response.error, isNull);
  });
}
