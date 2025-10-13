// Package imports:
import 'package:test/test.dart';

// Project imports:
import '../test_utils.dart';

void main() async {
  await setup();

  test('Get guild audit log', () async {
    final (success, failure) =
        await api.auditLogs.getGuildAuditLog(credentials.guildId);
    expect(failure, isNull);
  });

  test('Get guild audit log filtered by user', () async {
    final (success, failure) = await api.auditLogs.getGuildAuditLog(
      credentials.guildId,
      userId: credentials.userId,
    );
    expect(failure, isNull);
  });

  test('Get guild audit log limited', () async {
    final (success, failure) = await api.auditLogs.getGuildAuditLog(
      credentials.guildId,
      limit: 1,
    );
    expect(failure, isNull);
    expect(success?.data.auditLogEntries.length, 1);
  });
}
