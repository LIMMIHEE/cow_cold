import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/config/app_routes.dart';
import 'package:cow_cold/config/design_system/app_theme.dart';
import 'package:cow_cold/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: AppRoutes.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('ko', 'KR')],
      onInit: () {
        Get.put<UserController>(
          UserController(),
          permanent: true,
        );
        Get.changeTheme(
            AppThemeData.appThemeData(PrefsUtils.getBool(PrefsUtils.darkMode)));
      },
    );
  }
}
