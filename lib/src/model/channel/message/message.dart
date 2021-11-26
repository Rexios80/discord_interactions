// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/converter/flag/message_flag_converter.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

part 'message.g.dart';

/// Message structure
///
/// content, embeds, attachments, and components will require a privileged intent in 2022. Learn more here.
///
/// https://discord.com/developers/docs/resources/channel#message-object-message-structure
@JsonSerializable(includeIfNull: false)
class Message {
  /// id of the message
  final String? id;

  /// id of the channel the message was sent in
  @JsonKey(name: 'channel_id')
  final String? channelId;

  /// id of the guild the message was sent in
  @JsonKey(name: 'guild_id')
  final String? guildId;

  /// the author of this message (not guaranteed to be a valid user, see below)
  ///
  /// The author object follows the structure of the user object, but is only a
  /// valid user in the case where the message is generated by a user or bot user.
  /// If the message is generated by a webhook, the author object corresponds to
  /// the webhook's id, username, and avatar. You can tell if a message is
  /// generated by a webhook by checking for the webhook_id on the message object.
  final User? author;

  /// member properties for this message's author
  ///
  /// The member object exists in MESSAGE_CREATE and MESSAGE_UPDATE events from
  /// text-based guild channels, provided that the author of the message is not
  /// a webhook. This allows bots to obtain real-time member data without
  /// requiring bots to store member state in memory.
  final GuildMember? member;

  /// contents of the message
  final String? content;

  /// when this message was sent
  final DateTime? timestamp;

  /// when this message was edited (or null if never)
  @JsonKey(name: 'edited_timestamp')
  final DateTime? editedTimestamp;

  /// whether this was a TTS message
  final bool? tts;

  /// whether this message mentions everyone
  @JsonKey(name: 'mention_everyone')
  final bool? mentionEveryone;

  /// users specifically mentioned in the message
  ///
  /// array of user objects, with an additional partial member field
  ///
  /// The user objects in the mentions array will only have the partial member
  /// field present in MESSAGE_CREATE and MESSAGE_UPDATE events from text-based
  /// guild channels.
  final List<User>? mentions;

  /// roles specifically mentioned in this message
  @JsonKey(name: 'mention_roles')
  final List<String>? mentionRoles;

  /// channels specifically mentioned in this message
  ///
  /// Not all channel mentions in a message will appear in mention_channels.
  /// Only textual channels that are visible to everyone in a lurkable guild
  /// will ever be included. Only crossposted messages (via Channel Following)
  /// currently include mention_channels at all. If no mentions in the message
  /// meet these requirements, this field will not be sent.
  @JsonKey(name: 'mention_channels')
  final List<ChannelMention>? mentionChannels;

  /// any attached files
  final List<Attachment>? attachments;

  /// any embedded content
  final List<Embed>? embeds;

  /// reactions to the message
  final List<Reaction>? reactions;

  /// used for validating a message was sent
  final dynamic nonce;

  /// whether this message is pinned
  final bool? pinned;

  /// if the message is generated by a webhook, this is the webhook's id
  @JsonKey(name: 'webhook_id')
  final String? webhookId;

  /// type of message
  final MessageType? type;

  /// sent with Rich Presence-related chat embeds
  final MessageActivity? activity;

  /// sent with Rich Presence-related chat embeds
  final Application? application;

  /// if the message is a response to an Interaction, this is the id of the interaction's application
  @JsonKey(name: 'application_id')
  final String? applicationId;

  /// data showing the source of a crosspost, channel follow add, pin, or reply message
  @JsonKey(name: 'message_reference')
  final MessageReference? messageReference;

  /// message flags combined as a bitfield
  @MessageFlagConverter()
  final List<MessageFlag>? flags;

  /// the message associated with the message_reference
  ///
  /// This field is only returned for messages with a type of 19 (REPLY) or 21
  /// (THREAD_STARTER_MESSAGE). If the message is a reply but the referenced_message
  /// field is not present, the backend did not attempt to fetch the message
  /// that was being replied to, so its state is unknown. If the field exists
  /// but is null, the referenced message was deleted.
  @JsonKey(name: 'referenced_message')
  final Message? referencedMessage;

  /// sent if the message is a response to an Interaction
  final MessageInteraction? interaction;

  /// the thread that was started from this message, includes thread member object
  final Channel? thread;

  /// sent if the message contains components like buttons, action rows, or
  /// other interactive components
  final List<Component>? components;

  /// sent if the message contains stickers
  @JsonKey(name: 'sitcker_items')
  final List<Sticker>? stickerItems;

  /// array of sticker objects
  // @Deprecated('Use stickerItems instead')
  // final List<Sticker>? stickers;

  /// Constructor
  Message({
    this.id,
    this.channelId,
    this.guildId,
    this.author,
    this.member,
    this.content,
    this.timestamp,
    this.editedTimestamp,
    this.tts,
    this.mentionEveryone,
    this.mentions,
    this.mentionRoles,
    this.mentionChannels,
    this.attachments,
    this.embeds,
    this.reactions,
    this.nonce,
    this.pinned,
    this.webhookId,
    this.type,
    this.activity,
    this.application,
    this.applicationId,
    this.messageReference,
    this.flags,
    this.referencedMessage,
    this.interaction,
    this.thread,
    this.components,
    this.stickerItems,
  });

  /// From json
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
