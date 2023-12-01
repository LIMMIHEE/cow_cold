import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  AuthenticationRepository authRepository = AuthenticationRepository.instance;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 1), () {
      final userId = PrefsUtils.getString(PrefsUtils.email);
      if (userId.isNotEmpty) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/start');
      }
    });
  }

  Future<void> userLogout() async {
    await authRepository.logout();
    PrefsUtils.clear();

    Get.offAllNamed('/start');
  }

  Future<void> unregisterUser() async {
    await authRepository.deleteUser();
    PrefsUtils.clear();

    Get.offAllNamed('/start');
  }
}
