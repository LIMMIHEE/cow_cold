import 'package:firebase_database/firebase_database.dart';

class FirebaseDataBase {
  static final FirebaseDataBase instance = FirebaseDataBase();

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  FirebaseDatabase get database => _database;
}
