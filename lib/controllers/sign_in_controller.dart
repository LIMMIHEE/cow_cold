import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    final result = await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);

    if (result != null) {
      PrefsUtils.setString(PrefsUtils.userId, email);
      PrefsUtils.setString(PrefsUtils.password, password);
    }
  }
}
