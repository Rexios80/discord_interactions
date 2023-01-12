import 'dart:io';

void main() {
  final files = Directory('lib/src/api/src').listSync(recursive: true).whereType<File>();

  final typeRegex = RegExp(r'DiscordResponse<(.*)>');
  final callRegex = RegExp(
    r'validateApiCall\(\s*_dio.(.*?)\((.*?)\),\s*responseTransformer: \(data\) => (.*?)\(data\),\s*\);',
    dotAll: true,
  );

  for (final file in files) {
    final contents = file.readAsStringSync();

    final newContents =
        // ignore: prefer_interpolation_to_compose_strings
        "import 'package:dio_response_validator/dio_response_validator.dart';\n" +
            contents
                .replaceAllMapped(
                  typeRegex,
                  (m) => 'ValidatedResponse<Map<String, dynamic>, ${m[1]}>',
                )
                .replaceAllMapped(
                  callRegex,
                  (m) =>
                      '_dio.${m[1]}<Map<String, dynamic>>(${m[2]}).validate(transform: ${m[3]});',
                );

    file.writeAsStringSync(newContents);
  }
}
