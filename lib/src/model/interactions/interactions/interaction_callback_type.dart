// Package imports:
import 'package:json_annotation/json_annotation.dart';

enum InteractionCallbackType {
  /// ACK a Ping
  @JsonValue(1)
  pong,

  /// respond to an interaction with a message
  @JsonValue(4)
  channelMessageWithSource,

  /// ACK an interaction and edit a response later, the user sees a loading state
  @JsonValue(5)
  deferredChannelMessageWithSource,

  /// for components, ACK an interaction and edit the original message later;
  /// the user does not see a loading state
  /// 
  /// Only valid for component-based interactions
  @JsonValue(6)
  deferredUpdateMessage,

  /// for components, edit the message the component was attached to
  /// 
  /// Only valid for component-based interactions
  @JsonValue(7)
  updateMessage,

  /// respond to an autocomplete interaction with suggested choices
  @JsonValue(8)
  applicationCommandAutocompleteResult,
}
