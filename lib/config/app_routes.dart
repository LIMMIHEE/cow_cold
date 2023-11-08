import 'package:cow_cold/view/screen/home_screen.dart';
import 'package:cow_cold/view/screen/sign_in_screen.dart';
import 'package:cow_cold/view/screen/sign_up_screen.dart';
import 'package:cow_cold/view/screen/sqlash_screen.dart';
import 'package:cow_cold/view/screen/start_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/start', page: () => const StartScreen()),
    GetPage(name: '/signin', page: () => const SignInScreen()),
    GetPage(name: '/signup', page: () => const SignUpScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
