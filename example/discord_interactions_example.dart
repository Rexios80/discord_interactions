/// Example code that runs serverlessly on Google Cloud Run

import 'dart:convert';

import 'package:discord_interactions/discord_interactions.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

final validator = InteractionValidator(applicationPublicKey: '*****');

final api = DiscordApi(
  applicationId: '*****',
  userAgent: DiscordUserAgent(
    url: '*****',
    versionNumber: '*****',
  ),
  botToken: '*****',
);

@CloudFunction()
Future<Response> function(Request request) async {
  final body = await request.readAsString();

  // You must validate the request and reject it if it is invalid
  final valid = validator.validate(headers: request.headers, body: body);
  if (!valid) {
    return Response(401, body: 'invalid request signature');
  }

  final interaction = Interaction.fromJson(jsonDecode(body));

  // You must respond to ping interactions with a pong response
  if (interaction.type == InteractionType.ping) {
    return Response.ok(
      jsonEncode(InteractionResponse(type: InteractionCallbackType.pong)),
    );
  }

  await api.interactions.createInteractionResponse(
    interaction,
    response:
        InteractionResponse.withData(content: 'Hello, Discord Interactions!'),
  );

  return Response.ok(null);
}
