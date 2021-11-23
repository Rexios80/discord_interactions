// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:yaml/yaml.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';
import 'test_credentials.dart';

late final Dio dio;
late final DiscordApi api;
late final TestCredentials credentials;

// TODO: Make this work in GitHub Actions
//! DO NOT USE WITH PRODUCTION CREDENTIALS OR SERVERS
Future<void> setup() async {
  final credentialsFile = File('test_resources/credentials.json');
  final credentialsString = await credentialsFile.readAsString();
  final credentialsJson = jsonDecode(credentialsString);
  credentials = TestCredentials.fromJson(credentialsJson);

  final pubspecFile = File('pubspec.yaml');
  final pubspecString = await pubspecFile.readAsString();
  final pubspec = loadYaml(pubspecString);

  final userAgent = DiscordUserAgent(
    url: credentials.userAgentUrl,
    versionNumber: pubspec['version'],
    extra: 'Unit testing',
  );

  dio = Dio(BaseOptions(headers: {'User-Agent': userAgent.toString()}));

  api = DiscordApi(
    applicationId: credentials.applicationId,
    userAgent: userAgent,
    botToken: credentials.botToken,
  );
}

/// Helper function to avoid Dicord rate limiting
Future<void> avoidRateLimit() async {
  await Future.delayed(Duration(seconds: 1));
}
