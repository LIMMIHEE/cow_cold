import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/user.dart';
import 'package:cow_cold/data/providers/user_provider.dart';
import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:cow_cold/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final userRepository = UserRepository(userProvider: UserProvider());

  final email = TextEditingController();
  final password = TextEditingController();
  final nickName = TextEditingController();

  bool? isNotDuplicate;
  RxBool isDataEntered = false.obs;
  bool isDataFormatCondition = false;

  Future<void> registerUser() async {
    final result = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email.text, password.text);

    if (result != null && result.user != null) {
      Get.snackbar('회원가입 성공!', '소감기에 어서오세요!');

      await userRepository.setUser(User(
        id: email.text,
        name: nickName.text,
      ));
      await AuthenticationRepository.instance.updateUserName(nickName.text);
      AuthenticationRepository.instance
          .saveUserData(result.user!, nickName: nickName.text);

      Get.offAllNamed('/home');
    }
  }

  Future<void> duplicateEmailCheck() async {
    if (email.text.isEmpty) {
      Get.snackbar('이메일 입력', '이메일 입력을 진행해주세요.');
      return;
    }

    if (!GetUtils.isEmail(email.text)) {
      Get.snackbar('이메일 형식', '이메일 형식에 맞게 입력해주세요.');
      return;
    }

    final QuerySnapshot findUser = await userRepository.getUser(email.text);
    isNotDuplicate = findUser.docs.isEmpty;
    Get.snackbar(findUser.docs.isEmpty ? '사용 가능' : '사용 불가',
        findUser.docs.isEmpty ? '사용 가능 이메일입니다' : '이미 가입된 이메일 입니다.');
  }

  void dataEnteredCheck() {
    isDataEntered.value = email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        nickName.text.isNotEmpty;
  }

  void dataFormatCheck() {
    bool isDataFormatCondition = true;
    String title = '데이터 기입';
    String subText = '회원가입 정보를 입력해주세요.';

    if (isNotDuplicate == null) {
      title = '중복확인';
      subText = '아이디 중복 확인을 진행해 주세요.';
      isDataFormatCondition = false;
    }

    if (isNotDuplicate == false) {
      title = '중복되는 아이디';
      subText = '아이디를 변경해주세요.';
      isDataFormatCondition = false;
    }

    if (password.text.length < 8) {
      title = '비밀번호';
      subText = '비밀번호는 8자 이상 설정해주세요.';
      isDataFormatCondition = false;
    }

    if (isDataEntered.value && isDataFormatCondition) {
      this.isDataFormatCondition = true;
    } else {
      this.isDataFormatCondition = false;
      Get.snackbar(title, subText);
      return;
    }
  }
}
