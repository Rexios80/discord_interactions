An example project for discord_interactions

## Getting started
- Create an application on the [Discord Developer Portal](https://discord.com/developers/applications)
- Create a bot for your application
- Use the OAth2 URL generator to generate an invite URL for the bot and invite the bot to a guild
  - Basic Interactions bots only need the `applications.commands` scope to manage and respond to application commands
  - `bot` permissions are required for moderation, guild management, etc.
  - Bots with only the `applications.commands` scope do not show in the users list
- Create `lib/credentials.dart`
```dart
class Credentials {
  static const applicationPublicKey = '*****';
  static const applicationId = '*****';
  static const botToken = '*****';
  static const userAgentUrl = '*****';
  static const guildId = '*****';
}
```
- Follow the `Prerequisites` and `Build and deploy with a single command` steps [here](https://github.com/GoogleCloudPlatform/functions-framework-dart/blob/main/docs/quickstarts/03-quickstart-cloudrun.md)

## Usage

- Set the `INTERACTIONS ENDPOINT URL` on the application page to the URL of the Cloud Run function
- Run `dart run script/create_commands.dart` to create the commands in the guild
  - You will want to create global commands for a production bot, but those take time to propagate
- You can now invoke commands in your guild

## Additional information
See [discord_interactions_test](https://github.com/Rexios80/discord_interactions_test) for inspiration on how to test webhook bots locally