import 'package:test/test.dart';

import '../test_config.dart';

void main() async {
  await setup();

  final userId = applicationInfo['userId'];

  test('Get user', () async {
    final getUserResponse = await api.users.getUser(userId);
    getUserResponse.data!;
  });
}