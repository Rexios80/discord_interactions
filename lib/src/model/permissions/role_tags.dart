/// Role Tags structure
/// 
/// https://discord.com/developers/docs/topics/permissions#role-object-role-tags-structure
class RoleTags {
  /// the id of the bot this role belongs to
  final String? botId;

  /// the id of the integration this role belongs to
  final String? integrationId;

  /// whether this is the guild's premium subscriber role
  final bool premiumSubscriber;

  /// Constructor
  RoleTags({
    this.botId,
    this.integrationId,
    required this.premiumSubscriber,
  });

  /// From json
  factory RoleTags.fromJson(Map<String, dynamic> json) => RoleTags(
        botId: json['bot_id'],
        integrationId: json['integration_id'],
        premiumSubscriber: json.containsKey('premium_subscriber'),
      );

  /// To json
  Map<String, dynamic> toJson() => {
        'bot_id': botId,
        'integration_id': integrationId,
        if (premiumSubscriber) 'premium_subscriber': premiumSubscriber,
      };
}
