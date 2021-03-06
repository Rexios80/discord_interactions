// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/model/discord_model.dart';

part 'application_command.g.dart';

/// Application Command structure
///
/// Application commands are commands that an application can register to Discord
///
/// NOTE: Not all of these fields are nullable in the API, but they have been
/// left nullable for convenience with creating commands
///
/// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-structure
@JsonSerializable(includeIfNull: false)
class ApplicationCommand {
  /// unique id of the command
  final String? id;

  /// the type of command, defaults [ApplicationCommandType.chatInput] if not set
  final ApplicationCommandType? type;

  /// unique id of the parent application
  @JsonKey(name: 'application_id')
  final String? applicationId;

  /// guild id of the command, if not global
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// 1-32 character name
  final String name;

  /// 1-100 character description for CHAT_INPUT commands, empty string for USER and MESSAGE commands
  final String? description;

  /// the parameters for the command, max 25
  ///
  /// valid for CHAT_INPUT only
  final List<ApplicationCommandOption>? options;

  /// whether the command is enabled by default when the app is added to a guild
  ///
  /// default true
  @JsonKey(name: 'default_permission')
  final bool? defaultPermission;

  /// autoincrementing version identifier updated during substantial record changes
  final String? version;

  /// Constructor
  ApplicationCommand({
    this.id,
    this.type,
    this.applicationId,
    this.guildId,
    required this.name,
    this.description,
    this.options,
    this.defaultPermission,
    this.version,
  });

  /// From json
  factory ApplicationCommand.fromJson(Map<String, dynamic> json) =>
      _$ApplicationCommandFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ApplicationCommandToJson(this);
}
