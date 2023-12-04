import 'dart:convert';

import 'package:cow_cold/data/models/user.dart' as user_profile;
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  static AuthenticationRepository get instance => AuthenticationRepository();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      e.printError();
    } catch (e) {
      e.printError();
    }
    return null;
  }

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      e.printError();
      if (e.code == 'invalid-email') {
        Get.snackbar('이메일 형식', '이메일 형식에 맞게 입력해주세요.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Get.snackbar('유효하지 않은 유저', '유효하지 않은 유저입니다.');
      }
    } catch (e) {
      e.printError();
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> deleteUser() async => await _auth.currentUser?.delete();

  Future<void> updateUserName(String nickName) async =>
      await _auth.currentUser?.updateDisplayName(nickName);

  Future<void> saveUserData(User user, {String nickName = ''}) async {
    PrefsUtils.setString(PrefsUtils.email, user.email ?? '');
    PrefsUtils.setString(PrefsUtils.userId, user.uid);
    PrefsUtils.setString(PrefsUtils.nickName, user.displayName ?? nickName);
    if ((user.refreshToken ?? '').isNotEmpty) {
      PrefsUtils.setString(PrefsUtils.refreshToken, user.refreshToken!);
    }

    final userRepository = UserRepository.userRepository;
    userRepository.getUser(user.email ?? '').then((findUser) {
      final convertUser = user_profile.User.fromJson(
          jsonDecode(jsonEncode(findUser.docs.first.data())));
      PrefsUtils.setStringList(
          PrefsUtils.customCategory, convertUser.customCategory);
      PrefsUtils.setStringList(PrefsUtils.inviteWork, convertUser.inviteWorks);
    });
  }
}
