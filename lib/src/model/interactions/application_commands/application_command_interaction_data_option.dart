import 'package:discord_interactions/discord_interactions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_command_interaction_data_option.g.dart';

/// All options have names, and an option can either be a parameter and input
/// value--in which case value will be set--or it can denote a subcommand or
/// group--in which case it will contain a top-level key and another array of options.
///
/// [value] and [options] are mutually exclusive.
@JsonSerializable()
class ApplicationCommandInteractionDataOption {
  /// the name of the parameter
  final String name;

  /// value of application command option type
  final ApplicationCommandOptionType type;

  /// the value of the pair
  final dynamic value;

  /// present if this option is a group or subcommand
  final List<ApplicationCommandInteractionDataOption>? options;

  /// true if this option is the currently focused option for autocomplete
  final bool? focused;

  /// Create an ApplicationCommandInteractionDataOption
  ApplicationCommandInteractionDataOption({
    required this.name,
    required this.type,
    this.value,
    this.options,
    this.focused,
  });

  /// From json
  factory ApplicationCommandInteractionDataOption.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApplicationCommandInteractionDataOptionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() =>
      _$ApplicationCommandInteractionDataOptionToJson(this);
}
