import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/user.dart' as user;
import 'package:cow_cold/data/providers/user_provider.dart';
import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:cow_cold/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final userRepository = UserRepository(userProvider: UserProvider());

  final email = TextEditingController();
  final password = TextEditingController();
  final nickName = TextEditingController();

  RxBool isDataEntered = false.obs;
  bool isDataFormatCondition = false;
  bool? isNotDuplicate;

  Future<void> duplicateEmailCheck() async {
    if (email.text.isEmpty || !GetUtils.isEmail(email.text)) {
      Get.snackbar('이메일 입력', '올바른 이메일을 입력해주세요.');
      return;
    }

    final QuerySnapshot findUser = await userRepository.getUser(email.text);
    bool isNotDuplicate = findUser.docs.isEmpty;

    Get.snackbar(isNotDuplicate ? '사용 가능' : '사용 불가',
        isNotDuplicate ? '사용 가능한 이메일입니다.' : '이미 가입된 이메일입니다.');

    this.isNotDuplicate = isNotDuplicate;
    isDataEnteredCheck();
  }

  Future<void> registerUser() async {
    final result = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email.text, password.text);

    if (result != null && result.user != null) {
      await _completeUserRegistration(result);
    }
  }

  Future<void> _completeUserRegistration(UserCredential userCredential) async {
    Get.snackbar('회원가입 성공!', '소감기에 어서오세요!');

    await userRepository.setUser(user.User(
      id: email.text,
      name: nickName.text,
    ));

    await AuthenticationRepository.instance.updateUserName(nickName.text);
    AuthenticationRepository.instance
        .saveUserData(userCredential.user!, nickName: nickName.text);

    Get.offAllNamed('/home');
  }

  void isDataEnteredCheck() {
    isDataEntered.value = email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        nickName.text.isNotEmpty;
  }

  void dataFormatCheck() {
    String title = '데이터 기입';
    String subText = '회원가입 정보를 입력해주세요.';

    if (isDataEntered.value) {
      if (isNotDuplicate == null) {
        title = '중복확인';
        subText = '아이디 중복 확인을 진행해 주세요.';
      } else if (isNotDuplicate!) {
        if (password.text.length < 8) {
          title = '비밀번호';
          subText = '비밀번호는 8자 이상 설정해주세요.';
        } else {
          isDataFormatCondition = true;
          return;
        }
      } else if (!(isNotDuplicate!)) {
        title = '중복되는 아이디';
        subText = '아이디를 변경해주세요.';
      }
    }

    Get.snackbar(title, subText);
    isDataFormatCondition = false;
  }
}
