// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'ban.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ban _$BanFromJson(Map<String, dynamic> json) => Ban(
      reason: json['reason'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BanToJson(Ban instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason', instance.reason);
  val['user'] = instance.user;
  return val;
}
