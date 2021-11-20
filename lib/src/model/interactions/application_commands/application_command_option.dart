// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'application_command_option.g.dart';

/// Application Command Option structure
/// 
/// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-option-structure
@JsonSerializable()
class ApplicationCommandOption {
  /// the type of option
  final ApplicationCommandOptionType type;

  /// 1-32 character name
  final String name;

  /// 1-100 character description
  final String description;

  /// if the parameter is required or optional
  ///
  /// default false
  final bool required;

  /// choices for STRING, INTEGER, and NUMBER types for the user to pick from, max 25
  final List<ApplicationCommandOptionChoice>? choices;

  /// if the option is a subcommand or subcommand group type, these nested options will be the parameters
  final List<ApplicationCommandOption>? options;

  /// if the option is a channel type, the channels shown will be restricted to these types
  @JsonKey(name: 'channel_types')
  final List<ChannelType>? channelTypes;

  /// if the option is an INTEGER or NUMBER type, the minimum value permitted
  ///
  /// integer for INTEGER options, double for NUMBER options
  @JsonKey(name: 'min_value')
  final num? minValue;

  /// if the option is an INTEGER or NUMBER type, the maximum value permitted
  ///
  /// integer for INTEGER options, double for NUMBER options
  @JsonKey(name: 'max_value')
  final num? maxValue;

  /// enable autocomplete interactions for this option
  ///
  /// autocomplete may not be set to true if [choices] are present
  ///
  /// Options using autocomplete are not confined to only use choices given by the application.
  final bool? autocomplete;

  /// Constructor
  ApplicationCommandOption({
    required this.type,
    required this.name,
    required this.description,
    this.required = false,
    this.choices,
    this.options,
    this.channelTypes,
    this.minValue,
    this.maxValue,
    this.autocomplete,
  });

  /// From json
  factory ApplicationCommandOption.fromJson(Map<String, dynamic> json) =>
      _$ApplicationCommandOptionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ApplicationCommandOptionToJson(this);
}
