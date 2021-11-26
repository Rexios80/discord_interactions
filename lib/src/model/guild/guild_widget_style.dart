/// Widget Style options
///
/// https://discord.com/developers/docs/resources/guild#get-guild-widget-image-widget-style-options
enum GuildWidgetStyle {
  /// shield style widget with Discord icon and guild members online count
  ///
  /// Example: https://discord.com/api/guilds/81384788765712384/widget.png?style=shield
  shield,

  /// large image with guild icon, name and online count. "POWERED BY DISCORD"
  /// as the footer of the widget
  ///
  /// Example: https://discord.com/api/guilds/81384788765712384/widget.png?style=banner1
  banner1,

  /// smaller widget style with guild icon, name and online count. Split on the
  /// right with Discord logo
  ///
  /// Example: https://discord.com/api/guilds/81384788765712384/widget.png?style=banner2
  banner2,

  /// large image with guild icon, name and online count. In the footer, Discord
  /// logo on the left and "Chat Now" on the right
  ///
  /// Example: https://discord.com/api/guilds/81384788765712384/widget.png?style=banner3
  banner3,

  /// large Discord logo at the top of the widget. Guild icon, name and online
  /// count in the middle portion of the widget and a "JOIN MY SERVER" button
  /// at the bottom
  ///
  /// Example: https://discord.com/api/guilds/81384788765712384/widget.png?style=banner4
  banner4,
}

/// Extension on [GuildWidgetStyle]
extension GuildWidgetStyleExtension on GuildWidgetStyle {
  static const _enumMap = <GuildWidgetStyle, String>{
    GuildWidgetStyle.shield: 'shield',
    GuildWidgetStyle.banner1: 'banner1',
    GuildWidgetStyle.banner2: 'banner2',
    GuildWidgetStyle.banner3: 'banner3',
    GuildWidgetStyle.banner4: 'banner4',
  };

  /// Returns the string representation of the widget style
  String get value => _enumMap[this]!;
}
