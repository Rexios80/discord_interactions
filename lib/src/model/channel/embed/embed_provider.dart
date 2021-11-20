// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'embed_provider.g.dart';

/// Embed Provider structure
/// 
/// https://discord.com/developers/docs/resources/channel#embed-object-embed-provider-structure
@JsonSerializable()
class EmbedProvider {
  /// name of provider
  final String? name;

  /// url of provider
  final String? url;

  /// Constructor
  EmbedProvider({
    this.name,
    this.url,
  });

  /// From json
  factory EmbedProvider.fromJson(Map<String, dynamic> json) =>
      _$EmbedProviderFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$EmbedProviderToJson(this);
}
