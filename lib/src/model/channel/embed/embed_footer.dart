import 'package:json_annotation/json_annotation.dart';

part 'embed_footer.g.dart';

/// Embed Footer structure
@JsonSerializable()
class EmbedFooter {
  /// footer text
  final String text;

  /// url of footer icon (only supports http(s) and attachments)
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  /// a proxied url of footer icon
  @JsonKey(name: 'proxy_icon_url')
  final String? proxyIconUrl;

  /// Constructor
  EmbedFooter({
    required this.text,
    this.iconUrl,
    this.proxyIconUrl,
  });

  /// From json
  factory EmbedFooter.fromJson(Map<String, dynamic> json) =>
      _$EmbedFooterFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedFooterToJson(this);
}
