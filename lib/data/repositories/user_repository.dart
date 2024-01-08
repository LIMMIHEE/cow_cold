import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/user/user.dart';
import 'package:cow_cold/data/providers/user_provider.dart';

class UserRepository {
  static final UserRepository userRepository = UserRepository();
  final UserProvider userProvider = UserProvider();

  Future<void> setUser(User user) async {
    return userProvider.setUser(user);
  }

  Future<void> addCategory(String category) async {
    return userProvider.addCategory(category);
  }

  Future<void> addInviteWork(String inviteCode) async {
    return userProvider.addInviteWork(inviteCode);
  }

  Future<QuerySnapshot> getUser(String email) async {
    return userProvider.getUser(email);
  }
}
