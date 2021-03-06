// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'application_command_option_choice.g.dart';

/// Application Command Option Choice structure
///
/// If you specify choices for an option, they are the only valid values for a user to pick
///
/// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-option-choice-structure
@JsonSerializable(includeIfNull: false)
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
