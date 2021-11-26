// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'component.g.dart';

/// Component structure
///
/// https://discord.com/developers/docs/interactions/message-components#component-object-component-structure
@JsonSerializable(includeIfNull: false)
class Component {
  /// component type
  ///
  /// Valid for: all types
  final ComponentType type;

  /// a developer-defined identifier for the component, max 100 characters
  ///
  /// Valid for: buttons, select menus
  @JsonKey(name: 'custom_id')
  final String? customId;

  /// whether the component is disabled, default false
  ///
  /// Valid for: buttons, select menus
  final bool? disabled;

  /// one of button styles
  ///
  /// Valid for: buttons
  final ButtonStyle? style;

  /// text that appears on the button, max 80 characters
  ///
  /// Valid for: buttons
  final String? label;

  /// name, id, and animated
  ///
  /// Valid for: buttons
  final Emoji? emoji;

  /// a url for link-style buttons
  ///
  /// Valid for: buttons
  final String? url;

  /// the choices in the select, max 25
  ///
  /// Valid for: select menus
  final List<SelectOption>? options;

  /// custom placeholder text if nothing is selected, max 100 characters
  ///
  /// Valid for: select menus
  final String? placeholder;

  /// the minimum number of items that must be chosen; default 1, min 0, max 25
  ///
  /// Valid for: select menus
  @JsonKey(name: 'min_values')
  final int? minValues;

  /// the maximum number of items that can be chosen; default 1, max 25
  ///
  /// Valid for: select menus
  @JsonKey(name: 'max_values')
  final int? maxValues;

  /// a list of child components
  ///
  /// Valid for: action rows
  final List<Component>? components;

  /// Constructor
  Component({
    required this.type,
    this.customId,
    this.disabled,
    this.style,
    this.label,
    this.emoji,
    this.url,
    this.options,
    this.placeholder,
    this.minValues,
    this.maxValues,
    this.components,
  });

  /// From json
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}
