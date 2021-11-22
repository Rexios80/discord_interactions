import 'package:discord_interactions/src/converter/activity_button_list_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Activity button list converter', () {
    final converter = ActivityButtonListConverter();

    final buttonLabels = ['test1', 'test2'];
    final buttons = converter.fromJson(buttonLabels);

    buttons!;

    expect(buttons[0].label, buttonLabels[0]);
    expect(buttons[1].label, buttonLabels[1]);

    final json = converter.toJson(buttons);
    expect(json[0]['label'], buttonLabels[0]);
    expect(json[1]['label'], buttonLabels[1]);
  });
}
