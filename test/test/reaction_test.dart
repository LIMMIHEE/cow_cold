import 'dart:convert';

import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/reactions/reaction.dart';
import 'package:cow_cold/data/models/report/report.dart';
import 'package:cow_cold/view/widget/common/report_reaction_chip.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../data/controller/report_controller.dart';
import '../data/repository/test_repository.dart';

void main() {
  group('Test Reaction', () {
    final fireStore = FakeFirebaseFirestore();
    late TestRepository testRepository;

    setUp(
      () async {
        testRepository = TestRepository(firestore: fireStore);
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
      },
    );

    test('get Report and Reaction Model', () async {
      final result = await testRepository.fetchCollection('report');
      // 테스터 확인
      expect(result.docs.first['serverId'], 'testId');

      // 리액션 데이터 확인
      List<Reaction> reactions = result.docs.first['reactions']
          .map<Reaction>(
              (dynamic i) => Reaction.fromJson(i as Map<String, dynamic>))
          .toList();
      expect(reactions.first.emoji, '❤️');
    });

    testWidgets('Reaction Widget Test', (WidgetTester tester) async {
      final result = await testRepository.fetchCollection('report');
      final getReports = result.docs
          .map((report) =>
              Report.fromJson(jsonDecode(jsonEncode(report.data()))))
          .toList();

      // Controller를 초기화하고 GetView 위젯을 빌드
      await tester.pumpWidget(GetMaterialApp(
        home: Scaffold(
            // 리액션 위젯 추가
            body: ReportReactionChip(
                report: getReports.first, isMyReport: false)),
        initialBinding: BindingsBuilder(() {
          Get.put<ReportController>(MockReportController());
        }),
      ));

      // 위젯이 화면에 제대로 표시되었는지 확인
      expect(
          find.text('${getReports.first.reactions?.first.emoji}  '
              '${getReports.first.reactions?.first.reactionUsers.length}'),
          findsOneWidget);
    });
  });
}
