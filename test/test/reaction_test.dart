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
    final controller = MockReportController();

    setUp(
      () async {
        await controller.onInit();
      },
    );

    test('get Report and Reaction Model', () async {
      final reports = controller.myReports
          .where((report) => report.serverId == 'testId')
          .first;
      // 테스터 확인
      expect(reports.serverId, 'testId');
      expect(reports.reactions?.first.emoji, '❤️');
    });

    testWidgets('Reaction Widget Test', (WidgetTester tester) async {
      final reports = controller.myReports;

      // Controller를 초기화하고 GetView 위젯을 빌드
      await tester.pumpWidget(GetMaterialApp(
        home: Scaffold(
            // 리액션 위젯 추가
            body: ReportReactionChip(report: reports.first, isMyReport: false)),
        initialBinding: BindingsBuilder(() {
          Get.put<ReportController>(MockReportController());
        }),
      ));

      // 위젯이 화면에 제대로 표시되었는지 확인
      expect(
          find.text('${reports.first.reactions?.first.emoji}  '
              '${reports.first.reactions?.first.reactionUsers.length}'),
          findsOneWidget);
    });
  });
}
