import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions_example/commands.dart';
import 'package:discord_interactions_example/credentials.dart';

final api = DiscordApi(
  applicationId: Credentials.applicationId,
  userAgent: DiscordUserAgent(
    url: Credentials.userAgentUrl,
    versionNumber: '1.0.0',
  ),
  botToken: Credentials.botToken,
);

void main() async {
  final commands = [
    ...Command.values.map((e) => e.command),
  ];

  // Create global commands for poduction bots
  // This overwrites all commands, so make sure to have them all defined
  final response =
      await api.applicationCommands.bulkOverwriteGuildApplicationCommands(
    Credentials.guildId,
    commands: commands,
  );

  if (response.failure != null) {
    print(response.failure);
  } else {
    print('Successfully overwritten application commands');
  }
}
