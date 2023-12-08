import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/data/source/local/storage.dart';
import 'package:cow_cold/data/source/network/network_status.dart';
import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final AuthenticationRepository _authRepository =
      AuthenticationRepository.instance;
  late StreamSubscription<ConnectivityResult> _networkListener;
  Rx<NetworkStatus> deviceNetwork = NetworkStatus.offLine.obs;

  late String _userId;
  get userId => _userId;

  @override
  Future<void> onReady() async {
    _networkListener =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
    Future.delayed(const Duration(milliseconds: 1000), () async {
      _userId = await Storage.read(Storage.uid) ?? '';
      final email = await Storage.read(Storage.email) ?? '';
      if (email.isNotEmpty) {
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
    deleteUserData();

    Get.offAllNamed('/start');
  }

  Future<void> unregisterUser() async {
    await _authRepository.deleteUser();
    deleteUserData();

    Get.offAllNamed('/start');
  }

  void deleteUserData() {
    Prefs.clear();
    Storage.deleteAll();
    _userId = '';
  }

  void setUserId(String userId) {
    _userId = userId;
  }
}
