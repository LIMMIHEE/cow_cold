import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/user.dart';
import 'package:cow_cold/data/providers/user_provider.dart';

class UserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

  Future<void> setUser(User user) async {
    return userProvider.setUser(user);
  }

  Future<QuerySnapshot> getUser(String email) async {
    return userProvider.getUser(email);
  }
}
