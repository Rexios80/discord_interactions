// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overwrite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Overwrite _$OverwriteFromJson(Map<String, dynamic> json) => Overwrite(
      id: json['id'] as String,
      type: $enumDecode(_$OverwriteTypeEnumMap, json['type']),
      allow: json['allow'] as String,
      deny: json['deny'] as String,
    );

Map<String, dynamic> _$OverwriteToJson(Overwrite instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$OverwriteTypeEnumMap[instance.type],
      'allow': instance.allow,
      'deny': instance.deny,
    };

const _$OverwriteTypeEnumMap = {
  OverwriteType.role: 0,
  OverwriteType.member: 1,
};
