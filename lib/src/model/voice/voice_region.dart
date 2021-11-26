// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'voice_region.g.dart';

/// Voice Region structure
///
/// https://discord.com/developers/docs/resources/voice#voice-region-object-voice-region-structure
@JsonSerializable(includeIfNull: false)
class VoiceRegion {
  /// unique ID for the region
  final String id;

  /// name of the region
  final String name;

  /// true for a single server that is closest to the current user's client
  final bool optimal;

  /// whether this is a deprecated voice region (avoid switching to these)
  final bool deprecated;

  /// whether this is a custom voice region (used for events/etc)
  final bool custom;

  /// Constructor
  const VoiceRegion({
    required this.id,
    required this.name,
    required this.optimal,
    required this.deprecated,
    required this.custom,
  });

  /// From json
  factory VoiceRegion.fromJson(Map<String, dynamic> json) =>
      _$VoiceRegionFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$VoiceRegionToJson(this);
}
