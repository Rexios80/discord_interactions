// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

/// Attachment structure
/// 
/// For the attachments array in Message Create/Edit requests, only the id is required.
/// 
/// https://discord.com/developers/docs/resources/channel#attachment-object-attachment-structure
@JsonSerializable()
class Attachment {
  /// attachment id
  final String id;

  /// name of the file attached
  final String filename;

  /// description for the file
  final String? description;

  /// the attachment's media type
  @JsonKey(name: 'content_type')
  final String? contentType;

  /// size of the file in bytes
  final int size;

  /// source url of the file
  final String url;

  /// a proxied url of the file
  @JsonKey(name: 'proxy_url')
  final String proxyUrl;

  /// height of the file (if image)
  final int? height;

  /// width of the file (if image)
  final int? width;

  /// whether this attachment is ephemeral
  ///
  /// Ephemeral attachments will automatically be removed after a set period of
  /// time. Ephemeral attachments on messages are guaranteed to be available as
  /// long as the message itself exists.
  final bool? ephemeral;

  /// Constructor
  Attachment({
    required this.id,
    required this.filename,
    this.description,
    this.contentType,
    required this.size,
    required this.url,
    required this.proxyUrl,
    this.height,
    this.width,
    this.ephemeral,
  });

  /// Fron json
  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
