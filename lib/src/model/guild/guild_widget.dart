// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'guild_widget.g.dart';

/// Guild Widget structure
///
/// https://discord.com/developers/docs/resources/guild#guild-widget-object-guild-widget-structure
@JsonSerializable(includeIfNull: false)
class GuildWidget {
  /// whether the widget is enabled
  final bool enabled;

  /// the widget channel id
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// Constructor
  const GuildWidget({
    required this.enabled,
    this.channelId,
  });

  /// From json
  factory GuildWidget.fromJson(Map<String, dynamic> json) =>
      _$GuildWidgetFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$GuildWidgetToJson(this);
}
