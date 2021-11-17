import 'package:discord_interactions/src/model/channel_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_command_option.g.dart';

/// Application command option
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

  /// Create an [ApplicationCommandOption]
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

/// Application command option type
enum ApplicationCommandOptionType {
  /// sub command
  @JsonValue(1)
  subCommand,

  /// sub command group
  @JsonValue(2)
  subCommandGroup,

  /// string
  @JsonValue(3)
  string,

  /// Any integer between -2^53 and 2^53
  @JsonValue(4)
  integer,

  /// boolean
  @JsonValue(5)
  boolean,

  /// user
  @JsonValue(6)
  user,

  /// Includes all channel types + categories
  @JsonValue(7)
  channel,

  /// role
  @JsonValue(8)
  role,

  /// Includes users and roles
  @JsonValue(9)
  mentionable,

  /// Any double between -2^53 and 2^53
  @JsonValue(10)
  number,
}

/// If you specify choices for an option, they are the only valid values for a user to pick
@JsonSerializable()
class ApplicationCommandOptionChoice {
  /// 1-100 character choice name
  final String name;

  /// value of the choice, up to 100 characters if string
  ///
  /// string, integer, or double depending on the [ApplicationCommandOptionType]
  final dynamic value;

  /// Create an [ApplicationCommandOptionChoice]
  ApplicationCommandOptionChoice({
    required this.name,
    required this.value,
  });

  /// From json
  factory ApplicationCommandOptionChoice.fromJson(Map<String, dynamic> json) =>
      _$ApplicationCommandOptionChoiceFromJson(json);
  
  /// To json
  Map<String, dynamic> toJson() => _$ApplicationCommandOptionChoiceToJson(this);
}

// TODO: What is Application Command Interaction Data Option
// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-interaction-data-option-structure
