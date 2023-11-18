import 'package:cow_cold/view/screen/home_screen.dart';
import 'package:cow_cold/view/screen/search_screen.dart';
import 'package:cow_cold/view/screen/sign_in_screen.dart';
import 'package:cow_cold/view/screen/sign_up_screen.dart';
import 'package:cow_cold/view/screen/sqlash_screen.dart';
import 'package:cow_cold/view/screen/start_screen.dart';
import 'package:cow_cold/view/screen/work_detail_screen.dart';
import 'package:cow_cold/view/screen/write_report_screen.dart';
import 'package:cow_cold/view/screen/write_work_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/start', page: () => const StartScreen()),
    GetPage(name: '/signin', page: () => const SignInScreen()),
    GetPage(name: '/signup', page: () => const SignUpScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/write_work', page: () => const WriteWorkScreen()),
    GetPage(name: '/write_report', page: () => const WriteReportScreen()),
    GetPage(name: '/search', page: () => const SearchScreen()),
    GetPage(name: '/work_detail', page: () => const WorkDetailScreen()),
  ];
}
