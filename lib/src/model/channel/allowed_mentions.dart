// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'allowed_mentions.g.dart';

/// Allowed Mentions structure
///
/// The allowed mention field allows for more granular control over mentions
/// without various hacks to the message content. This will always validate
/// against message content to avoid phantom pings (e.g. to ping everyone, you
/// must still have @everyone in the message content), and check against
/// user/bot permissions.
///
/// https://discord.com/developers/docs/resources/channel#allowed-mentions-object-allowed-mentions-structure
@JsonSerializable(includeIfNull: false)
class AllowedMentions {
  /// An array of allowed mention types to parse from the content.
  final List<AllowedMentionType> parse;

  /// Array of role_ids to mention (Max size of 100)
  final List<String> roles;

  /// Array of user_ids to mention (Max size of 100)
  final List<String> users;

  /// For replies, whether to mention the author of the message being replied
  /// to (default false)
  @JsonKey(name: 'replied_user')
  final bool repliedUser;

  /// Constructor
  AllowedMentions({
    required this.parse,
    required this.roles,
    required this.users,
    required this.repliedUser,
  });

  /// From json
  factory AllowedMentions.fromJson(Map<String, dynamic> json) =>
      _$AllowedMentionsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$AllowedMentionsToJson(this);
}
