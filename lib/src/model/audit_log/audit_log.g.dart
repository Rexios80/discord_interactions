// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, document_ignores

part of 'audit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => AuditLog(
      auditLogEntries: (json['audit_log_entries'] as List<dynamic>)
          .map((e) => AuditLogEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      integrations: (json['integrations'] as List<dynamic>)
          .map((e) => Integration.fromJson(e as Map<String, dynamic>))
          .toList(),
      threads: (json['threads'] as List<dynamic>)
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      webhooks: (json['webhooks'] as List<dynamic>)
          .map((e) => Webhook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuditLogToJson(AuditLog instance) => <String, dynamic>{
      'audit_log_entries': instance.auditLogEntries,
      'integrations': instance.integrations,
      'threads': instance.threads,
      'users': instance.users,
      'webhooks': instance.webhooks,
    };
