// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      channelId: json['channel_id'] as String,
      guildId: json['guild_id'] as String?,
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      member: json['member'] == null
          ? null
          : GuildMember.fromJson(json['member'] as Map<String, dynamic>),
      content: json['content'] as String,
      timestamp: const ISO8601Converter().fromJson(json['timestamp'] as String),
      editedTimestamp: const ISO8601ConverterNullable()
          .fromJson(json['edited_timestamp'] as String?),
      tts: json['tts'] as bool,
      mentionEveryone: json['mention_everyone'] as bool,
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentionRoles: (json['mention_roles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mentionChannels: (json['mention_channels'] as List<dynamic>?)
          ?.map((e) => ChannelMention.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      embeds: json['embeds'] as List<dynamic>,
      reactions: json['reactions'] as List<dynamic>?,
      nonce: json['nonce'],
      pinned: json['pinned'] as bool,
      webhookId: json['webhook_id'] as String?,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      activity: json['activity'],
      application: json['application'],
      applicationId: json['application_id'] as String?,
      messageReference: json['message_reference'],
      flags: json['flags'] as int?,
      referencedMessage: json['referenced_message'] == null
          ? null
          : Message.fromJson(
              json['referenced_message'] as Map<String, dynamic>),
      interaction: json['interaction'],
      thread: json['thread'] == null
          ? null
          : Channel.fromJson(json['thread'] as Map<String, dynamic>),
      components: json['components'] as List<dynamic>?,
      stickerItems: json['sitcker_items'] as List<dynamic>?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'channel_id': instance.channelId,
      'guild_id': instance.guildId,
      'author': instance.author,
      'member': instance.member,
      'content': instance.content,
      'timestamp': const ISO8601Converter().toJson(instance.timestamp),
      'edited_timestamp':
          const ISO8601ConverterNullable().toJson(instance.editedTimestamp),
      'tts': instance.tts,
      'mention_everyone': instance.mentionEveryone,
      'mentions': instance.mentions,
      'mention_roles': instance.mentionRoles,
      'mention_channels': instance.mentionChannels,
      'attachments': instance.attachments,
      'embeds': instance.embeds,
      'reactions': instance.reactions,
      'nonce': instance.nonce,
      'pinned': instance.pinned,
      'webhook_id': instance.webhookId,
      'type': _$MessageTypeEnumMap[instance.type],
      'activity': instance.activity,
      'application': instance.application,
      'application_id': instance.applicationId,
      'message_reference': instance.messageReference,
      'flags': instance.flags,
      'referenced_message': instance.referencedMessage,
      'interaction': instance.interaction,
      'thread': instance.thread,
      'components': instance.components,
      'sitcker_items': instance.stickerItems,
    };

const _$MessageTypeEnumMap = {
  MessageType.defaultType: 0,
  MessageType.recipientAdd: 1,
  MessageType.recipientRemove: 2,
  MessageType.call: 3,
  MessageType.channelNameChange: 4,
  MessageType.channelIconChange: 5,
  MessageType.channelPinnedMessage: 6,
  MessageType.guildMemberJoin: 7,
  MessageType.userPremiumGuildSubscription: 8,
  MessageType.userPremiumGuildSubscriptionTier1: 9,
  MessageType.userPremiumGuildSubscriptionTier2: 10,
  MessageType.userPremiumGuildSubscriptionTier3: 11,
  MessageType.channelFollowAdd: 12,
  MessageType.guildDiscoveryDisqualified: 14,
  MessageType.guildDiscoveryRequalified: 15,
  MessageType.guildDiscoveryGracePeriodInitialWarning: 16,
  MessageType.guildDiscoveryGracePeriodFinalWarning: 17,
  MessageType.threadCreated: 18,
  MessageType.reply: 19,
  MessageType.chatInputCommand: 20,
  MessageType.threadStarterMessage: 21,
  MessageType.guildInviteReminder: 22,
  MessageType.contextMenuCommand: 23,
};
