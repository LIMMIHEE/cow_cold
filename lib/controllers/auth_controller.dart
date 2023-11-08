import 'package:cow_cold/common/prefs_utils.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() async {
    Future.delayed(const Duration(seconds: 1), () {
      final userId = PrefsUtils.getString(PrefsUtils.email);
      if (userId.isNotEmpty) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/start');
      }
    });

    super.onReady();
  }
}
