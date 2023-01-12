import 'dart:io';

void main() {
  final files =
      Directory('lib/src/api/src').listSync(recursive: true).whereType<File>();

  for (final file in files) {
    final contents = file.readAsStringSync();

    final newContents =
        // ignore: prefer_interpolation_to_compose_strings
        "import 'package:dio_response_validator/dio_response_validator.dart';\n" +
            contents.replaceAllMapped(
              RegExp(r'\(data\) => (.+?).fromJson\(data\)'),
              (m) => '${m[1]}.fromJson',
            );

    file.writeAsStringSync(newContents);
  }
}
