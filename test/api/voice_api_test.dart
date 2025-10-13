// Package imports:
import 'package:test/test.dart';

// Project imports:
import '../test_utils.dart';

void main() async {
  await setup();

  test('List voice regions', () async {
    final (success, failure) = await api.voice.listVoiceRegions();
    expect(success!.data.length, greaterThan(0));
  });
}
