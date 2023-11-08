import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => AuthenticationRepository();

  final _auth = FirebaseAuth.instance;
  get auth => _auth;

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
    } catch (e) {
      e.printError();
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> deleteUser() async => await _auth.currentUser?.delete();
}
