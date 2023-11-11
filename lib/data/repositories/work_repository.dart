import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:firebase_database/firebase_database.dart';

class WorkRepository {
  final WorkProvider workProvider;

  WorkRepository({required this.workProvider});

  Future<DatabaseReference> getWork(String inviteCode) async {
    return workProvider.getWork(inviteCode);
  }

  Future<void> setWork(String workServerId, String inviteCode) async {
    return workProvider.setWork(workServerId, inviteCode);
  }

  Future<void> updateAllowedUsers(
      String workServerId, List<String> allowedUsers) async {
    return workProvider.updateAllowedUsers(workServerId, allowedUsers);
  }
}
