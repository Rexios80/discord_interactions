import 'package:test/test.dart';

import '../test_utils.dart';

void main() async {
  await setup();

  test('Get guild audit log', () async {
    final response = await api.auditLogs.getGuildAuditLog(credentials.guildId);
    expect(response.error, isNull);
  });

  test('Get guild audit log filtered by user', () async {
    final response = await api.auditLogs.getGuildAuditLog(
      credentials.guildId,
      userId: credentials.userId,
    );
    expect(response.error, isNull);
  });
  
  test('Get guild audit log limited', () async {
    final response = await api.auditLogs.getGuildAuditLog(
      credentials.guildId,
      limit: 1,
    );
    expect(response.error, isNull);
    expect(response.data?.auditLogEntries.length, 1);
  });
}
