// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'test_credentials.g.dart';

@JsonSerializable(includeIfNull: false)
class TestCredentials {
  final String applicationId;
  final String botToken;
  final String userAgentUrl;
  final String interactionsRouterUrl;
  final String guildId;
  final String roleId;
  final String roleIconId;
  final String channelId;
  final String userId;
  final String userAccessToken;
  final String emojiName;
  final String emojiId;
  final String stickerId;

  TestCredentials({
    required this.applicationId,
    required this.botToken,
    required this.userAgentUrl,
    required this.interactionsRouterUrl,
    required this.guildId,
    required this.roleId,
    required this.roleIconId,
    required this.channelId,
    required this.userId,
    required this.userAccessToken,
    required this.emojiName,
    required this.emojiId,
    required this.stickerId,
  });

  /// From json
  factory TestCredentials.fromJson(Map<String, dynamic> json) =>
      _$TestCredentialsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$TestCredentialsToJson(this);
}
