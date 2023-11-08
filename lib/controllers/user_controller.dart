import 'package:cow_cold/data/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late final Rx<User?> user;
  AuthenticationRepository authRepository = AuthenticationRepository.instance;

  @override
  void onReady() {
    user = Rx<User?>(authRepository.auth);
    user.bindStream(authRepository.auth.userChanges());
  }
}
