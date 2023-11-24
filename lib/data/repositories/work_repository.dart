import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';

class WorkRepository {
  final WorkProvider workProvider;

  WorkRepository({required this.workProvider});

  Future<QuerySnapshot> getWorks() async {
    return await workProvider.getWorks();
  }

  Future<QuerySnapshot> getWorkInviteCode(String inviteCode) async {
    return await workProvider.getWorkInviteCode(inviteCode);
  }

  Future<QuerySnapshot> getInviteWork() async {
    return await workProvider.getInviteWork();
  }

  Future<Work> createWork(
      String title, String category, String description) async {
    return await workProvider.createWork(title, category, description);
  }

  Future<void> submitInviteCode(String inviteCode) async {
    return await workProvider.submitInviteCode(inviteCode);
  }

  Future<void> deleteWork(String serverId, String inviteCode) async {
    return await workProvider.deleteWork(serverId, inviteCode);
  }
}
