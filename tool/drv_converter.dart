import 'dart:io';

void main() {
  final files = Directory('lib').listSync(recursive: true).whereType<File>();

  final typeRegex = RegExp(r'DiscordResponse<(.*)>');
  final callRegex = RegExp(
    r'validateApiCall\((.*),.*responseTransformer: \(data\) => (.*)\(data\).*\)',
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
                  (m) =>
                      'ValidatedResponse<Map<String, dynamic>, ${m[1]}>',
                )
                .replaceAllMapped(
                  callRegex,
                  (m) => '${m[1]}.validate(transform: ${m[2]})',
                );

    file.writeAsStringSync(newContents);
  }
}
