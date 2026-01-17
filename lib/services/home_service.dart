import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class HomeService {
  Future<Map<String, dynamic>> fetchHomeData({
    required String id,
    required String token,
  }) async {
    final url =
        "${AppConstants.baseUrl}${AppConstants.homeEndpoint}"
        "?id=$id&token=$token";

    print('url:$url');
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      print('object:${response.body}');
      final body = jsonDecode(response.body);
      debugPrint('home body:$body');
      return body;
    } else {
      throw Exception("Failed to load home data");
    }
  }
}
