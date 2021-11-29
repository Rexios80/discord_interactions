import 'package:discord_interactions/discord_interactions.dart';
import 'package:enum_to_string/enum_to_string.dart';

/// A set of basic chat commands
enum Command {
  hello,
  echo,
}

/// The options that the commands can have
enum CommandOption {
  string,
}

/// An extension class to contian the [ApplicationCommandOption] objects for
/// the [CommandOption] enum
extension CommandOptionExtension on CommandOption {
  ApplicationCommandOption get option {
    switch (this) {
      case CommandOption.string:
        return ApplicationCommandOption(
          type: ApplicationCommandOptionType.string,
          name: EnumToString.convertToString(this),
          description: 'The string to echo',
          required: true,
        );
    }
  }
}

/// An extension class to contian the [ApplicationCommand] objects for
/// the [Command] enum
extension CommandExtension on Command {
  ApplicationCommand get command {
    switch (this) {
      case Command.hello:
        return ApplicationCommand(
          name: EnumToString.convertToString(this),
          description: 'Says hello',
        );
      case Command.echo:
        return ApplicationCommand(
          name: EnumToString.convertToString(this),
          description: 'Echoes a string',
          options: [
            CommandOption.string.option,
          ],
        );
    }
  }
}
