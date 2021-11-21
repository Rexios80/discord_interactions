import 'package:dio/dio.dart';
import 'package:discord_interactions/discord_interactions.dart';
import 'package:discord_interactions/src/util/discord_api_utils.dart';

/// Access to the Channels API
///
/// https://discord.com/developers/docs/resources/channel
class ChannelsApi {
  static const _basePath = '/channels';

  final Dio _dio;

  /// Constructor
  ChannelsApi(this._dio);

  // TODO: getChannel

  // TODO: modifyChannel

  // TODO: deleteChannel

  // TODO: getChannelMessages

  // TODO: getChannelMessage

  /// Discord may strip certain characters from message content, like invalid
  /// unicode characters or characters which cause unexpected message
  /// formatting. If you are passing user-generated strings into message
  /// content, consider sanitizing the data to prevent unexpected behavior and
  /// utilizing allowed_mentions to prevent unexpected mentions.
  ///
  /// Post a [Messsage] to a guild text or DM channel. Returns a [Message] object.
  /// Fires a Message Create Gateway event. See message formatting for more
  /// information on how to properly format messages.
  ///
  /// You may create a message as a reply to another message. To do so, include
  /// a message_reference with a message_id. The channel_id and guild_id in the
  /// message_reference are optional, but will be validated if provided.
  ///
  /// Files must be attached using a multipart/form-data body as described in
  /// Uploading Files.
  ///
  /// Limitations
  ///
  /// When operating on a guild channel, the current user must have the
  /// SEND_MESSAGES permission.
  ///
  /// When sending a message with tts (text-to-speech) set to true, the current
  /// user must have the SEND_TTS_MESSAGES permission.
  ///
  /// When creating a message as a reply to another message, the current user
  /// must have the READ_MESSAGE_HISTORY permission.
  ///
  /// The referenced message must exist and cannot be a system message.
  ///
  /// The maximum request size when sending a message is 8MB
  ///
  /// For the embed object, you can set every field except type (it will be rich
  /// regardless of if you try to set it), provider, video, and any height,
  /// width, or proxy_url values for images.
  ///
  /// Note that when sending a message, you must provide a value for at least
  /// one of content, embeds, or files[n].
  ///
  /// https://discord.com/developers/docs/resources/channel#create-message
  Future<DiscordResponse<Message>> createMessage(
    String channelId, {
    required Message message,
  }) {
    return validateApiCall(
      _dio.post(
        '$_basePath/$channelId/messages',
        data: message,
      ),
      responseTransformer: (data) => Message.fromJson(data),
    );
  }

  // TODO: Other endpoints
}
