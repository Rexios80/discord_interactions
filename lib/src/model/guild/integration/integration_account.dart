// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'integration_account.g.dart';

/// Integration Account structure
///
/// https://discord.com/developers/docs/resources/guild#integration-account-object-integration-account-structure
@JsonSerializable()
class IntegrationAccount {
  /// id of the account
  final String id;

  /// name of the account
  final String name;

  /// Constructor
  IntegrationAccount({
    required this.id,
    required this.name,
  });

  /// From json
  factory IntegrationAccount.fromJson(Map<String, dynamic> json) =>
      _$IntegrationAccountFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$IntegrationAccountToJson(this);
}
