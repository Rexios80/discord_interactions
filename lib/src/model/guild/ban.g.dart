// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'ban.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ban _$BanFromJson(Map<String, dynamic> json) => Ban(
      reason: json['reason'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BanToJson(Ban instance) => <String, dynamic>{
      if (instance.reason case final value?) 'reason': value,
      'user': instance.user,
    };
