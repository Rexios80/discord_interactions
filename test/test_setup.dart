import 'dart:convert';
import 'dart:io';

import 'package:discord_interactions/discord_interactions.dart';
import 'package:yaml/yaml.dart';

// TODO: Make this work in GitHub Actions
Future<DiscordApi> createDiscordApi() async {
  final applicationInfoFile = File('test_resources/application_info.json');
  final applicationInfoString = await applicationInfoFile.readAsString();
  final applicationInfo = jsonDecode(applicationInfoString);

  final pubspecFile = File('pubspec.yaml');
  final pubspecString = await pubspecFile.readAsString();
  final pubspec = loadYaml(pubspecString);

  return DiscordApi(
    applicationId: applicationInfo['applicationId'],
    userAgent: DiscordUserAgent(
      url: applicationInfo['userAgentUrl'],
      versionNumber: pubspec['version'],
      extra: 'Unit testing',
    ),
    botToken: applicationInfo['botToken'],
  );
}
