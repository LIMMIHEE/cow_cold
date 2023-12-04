import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool isDataEntered = false.obs;

  Future<void> loginUser() async {
    final result = await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email.text, password.text);

    if (result != null) {
      Get.snackbar('로그인 성공!', '소감기에 어서오세요!');
      await AuthenticationRepository.instance.saveUserData(result.user!);

      Get.offAllNamed('/home');
    }
  }

  void dataEnteredCheck() {
    isDataEntered.value = email.text.isNotEmpty && password.text.isNotEmpty;
  }
}
