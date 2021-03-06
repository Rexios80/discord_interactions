Create a serverless Discord bot in pure dart using Discord Interactions webhooks

## Features
| Feature                     | Status                     |
| --------------------------- | -------------------------- |
| Manage Application Commands | Full support (unit-tested) |
| Create message components   | Full support (unit-tested) |
| Respond to commands         | Full support (unit-tested) |
| File uploads                | Full support (unit-tested) |

## Supported APIs
| API                    | Status                               |
| ---------------------- | ------------------------------------ |
| Audit Logs             | Full support (unit-tested)           |
| Channels               | Full support (mostly unit-tested)    |
| Emojis                 | Full support (unit-tested)           |
| Guilds                 | Full support (mostly unit-tested)    |
| Guild Scheduled Events | Full support (untested)              |
| Guild Templates        | Full support (untested)              |
| Invites                | Full support (unit-tested)           |
| Stage Instances        | Full support (untested)              |
| Stickers               | Full support (partially unit-tested) |
| Users                  | Full support (unit-tested)           |
| Voice                  | Full support (unit-tested)           |
| Webhooks               | Full support (untested)              |

Full support for all Discord API endpoints is planned

## Getting started
This package is meant for running a Discord bot on serverless platforms. The example is made for Google Cloud Run, but other providers that support running dart code will work.

## Usage
Discord has a couple requirements that must be met before you can enable webhooks for Interactions. This package comes with helper functions to help you get started.

First, you must validate all requests sent to your bot. You must reject invalid requests. The `Validator` class handles this for you. The `applicationPublicKey` comes from your application's page on the Discord Developer Portal.

```dart
final validator = InteractionValidator(applicationPublicKey: '*****');

final valid = validator.validate(headers: request.headers, body: body);
if (!valid) {
    return Response(401, body: 'invalid request signature');
}
```

Second, you must respond to ping Interactions with a pong Response

```dart
final interaction = Interaction.fromJson(jsonDecode(body));

if (interaction.type == InteractionType.ping) {
    return Response.ok(jsonEncode(InteractionResponse.pong()));
}
```

If either of these requirements are not met, the Discord Developer Portal will reject your `INTERACTIONS ENDPOINT URL`

Now you can respond to Application Commands

Discord requires a specially formatted user agent for API calls. The `DiscordUserAgent` class handles this for you.  The `url` field should point to a useful webpage for your bot. The `versionNumber` field should match your bot's version number. There is also an optional `extra` field if you would like to provide additional information about your bot to Discord.

The `applicationId` and `botToken` fields come from your application's page on the Discord Developer Portal. If you do not provide a `botToken`, you must provide a `credentialsToken` instead.

```dart
final api = DiscordApi(
  applicationId: '*****',
  userAgent: DiscordUserAgent(
    url: '*****',
    versionNumber: '*****',
  ),
  botToken: '*****',
);

await api.interactions.createInteractionResponse(
    interaction.id,
    token: interaction.token,
    response:
        InteractionResponse.message(content: 'Hello, Discord Interactions!'),
);
```

## Additional information
This package is very much in-progress. If you have any suggestions or feedback, please open an issue on GitHub.
