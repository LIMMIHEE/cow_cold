import 'package:cow_cold/config/app_routes.dart';
import 'package:cow_cold/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: AppRoutes.routes,
      onInit: () {
        Get.put<AuthController>(
          AuthController(),
          permanent: true,
        );
      },
    );
  }
}
