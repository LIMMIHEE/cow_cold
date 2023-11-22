import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';

class WorkRepository {
  final WorkProvider workProvider;

  WorkRepository({required this.workProvider});

  Future<QuerySnapshot> getWork() async {
    return await workProvider.getWork();
  }

  Future<Work> createWork(
      String title, String category, String description) async {
    return await workProvider.createWork(title, category, description);
  }

  Future<void> updateAllowedUsers(
      String workServerId, List<String> allowedUsers) async {
    return await workProvider.updateAllowedUsers(workServerId, allowedUsers);
  }

  Future<void> deleteWork(String serverId) async {
    return await workProvider.deleteWork(serverId);
  }
}
