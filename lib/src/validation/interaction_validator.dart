// Package imports:
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:pinenacl/ed25519.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Validate received Interactions
///
/// This is required for Discord to send webhook events
///
/// If you are not properly validating this signature header, we will not allow
/// you to save your interactions URL in the Dev Portal. We will also do automated,
/// routine security checks against your endpoint, including purposefully sending
/// you invalid signatures. If you fail the validation, we will remove your
/// interactions URL in the future and alert you via email and System DM.
///
/// https://discord.com/developers/docs/interactions/receiving-and-responding#security-and-authorization
class InteractionValidator {
  final VerifyKey _verifyKey;

  /// Your public key can be found on your application in the Developer Portal
  InteractionValidator({required String applicationPublicKey})
      : _verifyKey =
            VerifyKey(Uint8List.fromList(hex.decode(applicationPublicKey)));

  /// Validate an Interaction message
  bool validate({required Map<String, String> headers, required String body}) {
    final signature = headers[DiscordHeader.signatureHeaderKey];
    final timestamp = headers[DiscordHeader.timestampHeaderKey];

    if (signature == null || timestamp == null) {
      return false;
    }

    try {
      return _verifyKey.verify(
        signature: Signature(Uint8List.fromList(hex.decode(signature))),
        message: Uint8List.fromList(utf8.encode('$timestamp$body')),
      );
    } catch (e) {
      return false;
    }
  }
}
