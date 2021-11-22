// Package imports:
import 'package:test/test.dart';

// Project imports:
import '../test_setup.dart';

void main() async {
  await setup();

  final userId = credentials['userId'];

  test('Get user', () async {
    final getUserResponse = await api.users.getUser(userId);
    getUserResponse.data!;
  });
}
