import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ProductService {
  Future<Map<String, dynamic>> fetchProductsByCategory({
    required String id,
    required String token,
  }) async {
    final url =

    "${AppConstants.baseUrl}${AppConstants.homeEndpoint}"
        "?id=$id&token=$token&by=category";

    print("PRODUCT API URL: $url");

    final response = await http.post(Uri.parse(url));

    print("STATUS CODE: ${response.statusCode}");
    print("RAW RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
