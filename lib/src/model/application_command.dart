import 'package:discord_interactions/src/model/application_command_option.dart';

/// Application commands are commands that an application can register to Discord
class ApplicationCommand {
  /// unique id of the command
  final String? id;

  /// the type of command, defaults [ApplicationCommandType.chatInput] if not set
  final ApplicationCommandType type;

  // TODO: Add json key
  /// unique id of the parent application
  final String? applicationId;

  // TODO: add json key
  /// guild id of the command, if not global
  final String? guildId;

  /// 1-32 character name
  final String name;

  /// 1-100 character description for CHAT_INPUT commands, empty string for USER and MESSAGE commands
  final String description;

  /// the parameters for the command, max 25
  ///
  /// valid for CHAT_INPUT only
  final List<ApplicationCommandOption>? options;

  // TODO: Add json key
  /// whether the command is enabled by default when the app is added to a guild
  ///
  /// default true
  final bool defaultPermission;

  /// autoincrementing version identifier updated during substantial record changes
  final String? version;

  /// Create an [ApplicationCommand]
  ApplicationCommand({
    this.id,
    this.type = ApplicationCommandType.chatInput,
    this.applicationId,
    this.guildId,
    required this.name,
    required this.description,
    this.options,
    this.defaultPermission = true,
    this.version,
  });
}

// TODO: Add json serialization values
/// The type of command
enum ApplicationCommandType {
  /// Slash commands; a text-based command that shows up when a user types /
  chatInput,

  /// A UI-based command that shows up when you right click or tap on a user
  user,

  /// A UI-based command that shows up when you right click or tap on a message
  message,
}
