import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions_example/commands.dart';
import 'package:discord_interactions_example/credentials.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final app = Router()..get('/', handleHttpRequest);

  final port = Platform.environment.containsKey('PORT')
      ? int.parse(Platform.environment['PORT']!)
      : 8080;
  final server = await shelf_io.serve(app.call, '0.0.0.0', port);

  print('Listening on :${server.port}');
}

final validator = InteractionValidator(
  applicationPublicKey: Credentials.applicationPublicKey,
);

final api = DiscordApi(
  applicationId: Credentials.applicationId,
  userAgent: DiscordUserAgent(
    url: Credentials.userAgentUrl,
    versionNumber: '1.0.0',
  ),
  botToken: Credentials.botToken,
);

Future<Response> handleHttpRequest(Request request) async {
  final body = await request.readAsString();

  // Validate the request
  final valid = validator.validate(headers: request.headers, body: body);
  if (!valid) {
    return Response(401, body: 'invalid request signature');
  }

  // Deserialize the interaction
  final interaction = Interaction.fromJson(jsonDecode(body));

  // Respond to pings
  if (interaction.type == InteractionType.ping) {
    return Response.ok(
      jsonEncode(InteractionResponse.pong()),
    );
  }

  // Respond to the interaction
  await respond(interaction);

  // Respond to the initial request
  //
  // Interaction tokens are valid for 15 minutes and can be used to send
  // followup messages but you must send an initial response within 3 seconds
  // of receiving the event. If the 3 second deadline is exceeded, the token
  // will be invalidated.
  //
  // https://discord.com/developers/docs/interactions/receiving-and-responding#responding-to-an-interaction
  return Response.ok(null);
}

Future<void> respond(Interaction interaction) async {
  // Avoid using null check operators in production code
  final commandName = interaction.data!.name!;

  // Parse the command into the enum
  final command = Command.values.byName(commandName);

  final InteractionResponse response;
  switch (command) {
    case Command.hello:
      response = InteractionResponse.message(content: 'Hello!');
    case Command.echo:
      // Get the echo string from the interaction data
      final echoString = interaction.data!.options![0].value;
      response = InteractionResponse.message(content: echoString);
  }

  // Respond to the interaction
  await api.interactions.createInteractionResponse(
    interaction.id,
    token: interaction.token,
    response: response,
  );
}
