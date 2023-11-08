import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStore {
  static final FirebaseStore instance = FirebaseStore();

  final FirebaseFirestore _store = FirebaseFirestore.instance;
  get store => _store;
}
