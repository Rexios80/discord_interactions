// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:discord_interactions/discord_interactions.dart';

/// Byte transform String to [Permission]
class PermissionConverter extends JsonConverter<List<Permission>, String> {
  /// Constructor
  const PermissionConverter();

  @override
  List<Permission> fromJson(String json) {
    final permissionBytes = int.parse(json);
    return Permission.values
        .where((flag) => (permissionBytes & flag.value) == flag.value)
        .toList();
  }

  @override
  String toJson(List<Permission> object) {
    return object.fold<int>(0, (value, flag) => value | flag.value).toString();
  }
}

/// Byte transform String to [Permission] that is nullable
class PermissionConverterNullable
    extends JsonConverter<List<Permission>?, String?> {
  /// Constructor
  const PermissionConverterNullable();

  @override
  List<Permission>? fromJson(String? json) {
    if (json == null) return null;
    final permissionBytes = int.parse(json);
    return Permission.values
        .where((flag) => (permissionBytes & flag.value) == flag.value)
        .toList();
  }

  @override
  String? toJson(List<Permission>? object) {
    if (object == null) return null;
    return object.fold<int>(0, (value, flag) => value | flag.value).toString();
  }
}
