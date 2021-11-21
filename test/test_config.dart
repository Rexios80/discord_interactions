// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:yaml/yaml.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

late final Dio dio;
late final DiscordApi api;
late final Map<String, dynamic> applicationInfo;

// TODO: Make this work in GitHub Actions
Future<void> setup() async {
  final applicationInfoFile = File('test_resources/application_info.json');
  final applicationInfoString = await applicationInfoFile.readAsString();
  applicationInfo = jsonDecode(applicationInfoString);

  final pubspecFile = File('pubspec.yaml');
  final pubspecString = await pubspecFile.readAsString();
  final pubspec = loadYaml(pubspecString);

  final userAgent = DiscordUserAgent(
    url: applicationInfo['userAgentUrl'],
    versionNumber: pubspec['version'],
    extra: 'Unit testing',
  );

  dio = Dio(BaseOptions(headers: {'User-Agent': userAgent.toString()}));

  api = DiscordApi(
    applicationId: applicationInfo['applicationId'],
    userAgent: userAgent,
    botToken: applicationInfo['botToken'],
  );
}
