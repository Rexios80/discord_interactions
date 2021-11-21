/// Activity Party structure
///
/// https://discord.com/developers/docs/topics/gateway#activity-object-activity-party
class ActivityParty {
  /// the id of the party
  final String? id;

  /// the party's current size
  final int? currentSize;

  /// the party's max size
  final int? maxSize;

  /// Constructor
  ActivityParty({
    this.id,
    this.currentSize,
    this.maxSize,
  });

  /// From json
  factory ActivityParty.fromJson(Map<String, dynamic> json) => ActivityParty(
        id: json['id'] as String?,
        currentSize: (json['size'] as List?)?[0] as int?,
        maxSize: (json['size'] as List?)?[1] as int?,
      );

  /// To json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        if (currentSize != null && maxSize != null)
          'size': [currentSize, maxSize],
      };
}
