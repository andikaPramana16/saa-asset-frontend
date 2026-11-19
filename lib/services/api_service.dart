import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static const String _envBaseUrl = String.fromEnvironment('API_BASE_URL');


  static String get baseUrl {
    if (_envBaseUrl.isNotEmpty) return _envBaseUrl;
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:1234';
    }
    return 'http://localhost:1234';
  }

  static Future<List<Map<String, dynamic>>> getList(String path) async {
    final response = await http
        .get(Uri.parse('$baseUrl$path'))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('GET $path gagal (${response.statusCode})');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final data = body['data'];
    if (data == null) return []; 

    return (data as List).cast<Map<String, dynamic>>();
  }
}
