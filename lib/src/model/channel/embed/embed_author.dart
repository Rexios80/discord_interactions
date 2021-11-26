// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'embed_author.g.dart';

/// Embed Author structure
///
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-author-structure
@JsonSerializable(includeIfNull: false)
class EmbedAuthor {
  /// name of author
  final String name;

  /// url of author
  final String? url;

  /// url of author icon (only supports http(s) and attachments)
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  /// a proxied url of author icon
  @JsonKey(name: 'proxy_icon_url')
  final String? proxyIconUrl;

  /// Constructor
  EmbedAuthor({
    required this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  });

  /// From json
  factory EmbedAuthor.fromJson(Map<String, dynamic> json) =>
      _$EmbedAuthorFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedAuthorToJson(this);
}
