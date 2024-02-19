import 'dart:convert';

import 'package:covid_traking/core/helpers/helpers.dart';
import 'package:flutter/services.dart';

Future<dynamic> loadJson(String path) async {
  try {
    final result = await rootBundle.load(path);

    return jsonDecode(utf8.decode(result.buffer.asUint8List()));
  } catch (error) {
    throw DomainError.unexpected;
  }
}
