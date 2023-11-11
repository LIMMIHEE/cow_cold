import 'package:cow_cold/data/source/network/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';

class WorkProvider {
  final dataBase = FirebaseDataBase.instance.database;

  Future<DatabaseReference> getWork(String inviteCode) async {
    return dataBase.ref('work').child(inviteCode);
  }

  Future<void> setWork(String workServerId, String inviteCode) async {
    return await dataBase
        .ref('work')
        .child(workServerId)
        .set({'inviteCode': inviteCode, 'allowedUsers': []});
  }

  Future<void> updateAllowedUsers(
      String workServerId, List<String> allowedUsers) async {
    return await dataBase
        .ref('work')
        .child(workServerId)
        .update({'allowedUsers': allowedUsers});
  }
}
