import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';


class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  RxString userId = ''.obs;
  RxString token = ''.obs;

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    try {
      isLoading(true);

      final Map<String, dynamic> result =
      await _authService.login(email: email, password: password);

      debugPrint("LOGIN RESULT MAP: $result");

      if (result['success'] == true) {
        userId.value = result['id'].toString();   // "80y"
        token.value = result['token'].toString();

        debugPrint("USER ID STORED: ${userId.value}");
        debugPrint("TOKEN STORED: ${token.value}");

        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Login Failed", result['message'] ?? "Invalid credentials");
      }
    } catch (e) {
      debugPrint("LOGIN ERROR: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
