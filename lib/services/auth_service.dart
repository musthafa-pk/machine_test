import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:macine_test/utils/constants.dart';

class AuthService {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("${AppConstants.baseUrl}/login"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email_phone": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print("LOGIN RESPONSE: $body");

      if (body['success'] == 1) {
        print('heeeeeeeeer');
        return {
          "success": true,
        "id": body['customerdata']['id'].toString(),
          "token": body['customerdata']['token'].toString(),
        };
      } else {
        return {
          "success": false,
          "message": body['message'] ?? "Login failed",
        };
      }
    } else {
      throw Exception("Server error");
    }
  }
}
