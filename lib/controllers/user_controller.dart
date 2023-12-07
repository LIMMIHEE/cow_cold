import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/source/network/network_status.dart';
import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final AuthenticationRepository _authRepository =
      AuthenticationRepository.instance;
  late StreamSubscription<ConnectivityResult> _networkListener;
  Rx<NetworkStatus> deviceNetwork = NetworkStatus.offLine.obs;

  @override
  void onReady() {
    _networkListener =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
    Future.delayed(const Duration(milliseconds: 1000), () {
      final userId = PrefsUtils.getString(PrefsUtils.email);
      if (userId.isNotEmpty) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/start');
      }
    });

    super.onReady();
  }

  @override
  dispose() {
    _networkListener.cancel();
    super.dispose();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      deviceNetwork.value = NetworkStatus.onLine;
    } else if (result == ConnectivityResult.none) {
      deviceNetwork.value = NetworkStatus.offLine;
    }
  }

  Future<void> userLogout() async {
    await _authRepository.logout();
    PrefsUtils.clear();

    Get.offAllNamed('/start');
  }

  Future<void> unregisterUser() async {
    await _authRepository.deleteUser();
    PrefsUtils.clear();

    Get.offAllNamed('/start');
  }
}
