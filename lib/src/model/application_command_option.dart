import 'package:discord_interactions/src/model/channel_type.dart';

/// Application command option
class ApplicationCommandOption<T> {
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

  // TODO: Does this generic thing work?
  /// choices for STRING, INTEGER, and NUMBER types for the user to pick from, max 25
  final List<ApplicationCommandOptionChoice<T>>? choices;

  /// if the option is a subcommand or subcommand group type, these nested options will be the parameters
  final List<ApplicationCommandOption>? options;

  // TODO: Json key
  /// if the option is a channel type, the channels shown will be restricted to these types
  final List<ChannelType>? channelTypes;

  // TODO: Json key
  /// if the option is an INTEGER or NUMBER type, the minimum value permitted
  ///
  /// integer for INTEGER options, double for NUMBER options
  final T? minValue;

  // TODO: Json key
  /// if the option is an INTEGER or NUMBER type, the maximum value permitted
  ///
  /// integer for INTEGER options, double for NUMBER options
  final T? maxValue;

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
}

// TODO: Add json serialization values
/// Application command option type
enum ApplicationCommandOptionType {
  /// sub command
  subCommand,

  /// sub command group
  subCommandGroup,

  /// string
  string,

  /// Any integer between -2^53 and 2^53
  integer,

  /// boolean
  boolean,

  /// user
  user,

  /// Includes all channel types + categories
  channel,

  /// role
  role,

  /// Includes users and roles
  mentionable,

  /// Any double between -2^53 and 2^53
  number,
}

/// If you specify choices for an option, they are the only valid values for a user to pick
class ApplicationCommandOptionChoice<T> {
  /// 1-100 character choice name
  final String name;

  /// value of the choice, up to 100 characters if string
  ///
  /// string, integer, or double depending on the [ApplicationCommandOptionType]
  final T value;

  /// Create an [ApplicationCommandOptionChoice]
  ApplicationCommandOptionChoice({
    required this.name,
    required this.value,
  });
}

// TODO: What is Application Command Interaction Data Option
// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-interaction-data-option-structure
