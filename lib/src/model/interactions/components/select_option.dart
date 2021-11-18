import 'package:discord_interactions/src/model/emoji/emoji.dart';
import 'package:json_annotation/json_annotation.dart';

part 'select_option.g.dart';

/// Select option
@JsonSerializable()
class SelectOption {
  /// the user-facing name of the option, max 100 characters
  final String label;

  /// the dev-define value of the option, max 100 characters
  final String value;

  /// an additional description of the option, max 100 characters
  final String? description;

  /// partial emoji object
  ///
  /// id, name, and animated
  final Emoji? emoji;

  /// will render this option as selected by default
  @JsonKey(name: 'default')
  final bool? defaultSelected;

  /// Select option
  SelectOption({
    required this.label,
    required this.value,
    this.description,
    this.emoji,
    this.defaultSelected,
  });

  /// From json
  factory SelectOption.fromJson(Map<String, dynamic> json) =>
      _$SelectOptionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$SelectOptionToJson(this);
}
