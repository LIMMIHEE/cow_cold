import 'dart:convert';

import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/reactions/reaction.dart';
import 'package:cow_cold/data/models/report/report.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:get/get.dart';

import '../repository/test_repository.dart';

class MockReportController extends ReportController {
  final fireStore = FakeFirebaseFirestore();
  late TestRepository testRepository;

  @override
  Future<void> onInit() async {
    userId = 'testUserId';
    testRepository = TestRepository(firestore: fireStore);
    await loadReports();
  }

  Future<void> loadReports() async {
    // 데이터 추가
    final newReport = const Report(
      serverId: 'testId',
      workServerId: 'workServerId',
      createUserId: 'createUserId',
      createUserName: 'tester',
      updateDate: '20240103',
      title: '제목',
      content: '내용',
      reactions: [],
    ).toJson();

    newReport['reactions'] = [
      const Reaction(emoji: '❤️', reactionUsers: ['test', 'test2'])
    ].map((e) => e.toJson()).toList();
    fireStore.collection('report').add(newReport);

    //데이터 가져오기 및 입력
    final result = await testRepository.fetchCollection('report');
    List<Report> reports = result.docs
        .map((report) => Report.fromJson(jsonDecode(jsonEncode(report.data()))))
        .toList();
    myReports.assignAll(reports);
  }
}
