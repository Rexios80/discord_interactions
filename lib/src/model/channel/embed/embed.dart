// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/src/converter/iso8601_converter.dart';
import 'package:discord_interactions/src/model/discord_model.dart';

part 'embed.g.dart';

/// Embed structure
/// 
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-structure
@JsonSerializable()
class Embed {
  /// title of embed
  final String? title;

  /// type of embed (always "rich" for webhook embeds)
  final EmbedType? type;

  /// description of embed
  final String? description;

  /// url of embed
  final String? url;

  /// timestamp of embed content
  @ISO8601ConverterNullable()
  final DateTime? timestamp;

  /// color code of the embed
  final int? color;

  /// footer information
  final EmbedFooter? footer;

  /// image information
  final EmbedImage? image;

  /// thumbnail information
  final EmbedThumbnail? thumbnail;

  /// video information
  final EmbedVideo? video;

  /// provider information
  final EmbedProvider? provider;

  /// author information
  final EmbedAuthor? author;

  /// fields information
  final List<EmbedField>? fields;

  /// Constructor
  Embed({
    this.title,
    this.type,
    this.description,
    this.url,
    this.timestamp,
    this.color,
    this.footer,
    this.image,
    this.thumbnail,
    this.video,
    this.provider,
    this.author,
    this.fields,
  });

  /// From json
  factory Embed.fromJson(Map<String, dynamic> json) => _$EmbedFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedToJson(this);
}
