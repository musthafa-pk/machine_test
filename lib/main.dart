import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macine_test/modules/Login/LoginPage.dart';
import 'package:macine_test/modules/home/HomePage.dart';

import 'modules/Login/auth_controller.dart';

void main() {
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lufga',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}