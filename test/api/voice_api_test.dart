import 'package:test/test.dart';

import '../test_utils.dart';

void main() async {
  await setup();

  test('List voice regions', () async {
    final response = await api.voice.listVoiceRegions();
    expect(response.data!.length, greaterThan(0));
  });
}
