// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

part 'list_threads_response.g.dart';

/// List Threads Response structure
///
/// https://discord.com/developers/docs/resources/channel#list-public-archived-threads-response-body
@JsonSerializable(includeIfNull: false)
class ListThreadsResponse {
  /// the threads
  final List<Channel> threads;

  /// a thread member object for each returned thread the current user has
  /// joined
  final List<ThreadMember> members;

  /// whether there are potentially additional threads that could be returned on a subsequent call
  @JsonKey(name: 'has_more')
  final bool? hasMore;

  /// Constructor
  ListThreadsResponse({
    required this.threads,
    required this.members,
    this.hasMore,
  });

  /// From json
  factory ListThreadsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThreadsResponseFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$ListThreadsResponseToJson(this);
}
