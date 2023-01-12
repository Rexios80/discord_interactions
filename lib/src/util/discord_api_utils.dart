// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

/// Create [FormData] from a [payload] and [files]
FormData createFormData(dynamic payload, List<MultipartFile>? files) {
  final formMap = <String, dynamic>{
    'payload_json': jsonEncode(payload),
  };

  if (files != null) {
    files.forEachIndexed((index, file) {
      formMap['files[$index]'] = file;
    });
  }

  return FormData.fromMap(formMap);
}
