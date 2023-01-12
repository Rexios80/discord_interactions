import 'dart:io';

void main() {
  final files =
      Directory('lib/src/api/src').listSync(recursive: true).whereType<File>();

  for (final file in files) {
    final contents = file.readAsStringSync();

    final newContents = contents.replaceAllMapped(
      RegExp(r'\(data\) => (.+?).fromJson\(data\)'),
      (m) => '${m[1]}.fromJson',
    );

    file.writeAsStringSync(newContents);
  }
}
