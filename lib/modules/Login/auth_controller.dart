import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password cannot be empty",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;

      if (email == AppConstants.testEmail &&
          password == AppConstants.testPassword) {
        Get.offAllNamed('/home');
      } else {
        Get.snackbar(
          "Login Failed",
          "Invalid email or password",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
