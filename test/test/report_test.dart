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
  group('Test Report', () {
    final controller = MockReportController();

    setUp(
      () async {
        if (!controller.controllerSetting) {
          await controller.onInit();
        }
      },
    );

    test('get Report', () {
      final reports = controller.myReports;
      // 데이터 로드 확인
      expect(reports.first.serverId, 'testId');
    });

    test('add Report', () {
      controller.addReport(const Report(
          serverId: 'testId2',
          workServerId: 'workServerId2',
          createUserId: 'createUserId2',
          createUserName: 'tester2',
          updateDate: '20240110',
          title: '제목2',
          content: '내용2',
          reactions: []));
      // 데이터 추가 확인
      final report =
          controller.myReports.where((report) => report.serverId == 'testId2');

      expect(report.isNotEmpty, true);
    });

    test('update Report', () async {
      await controller.updateMyReport(const Report(
          serverId: 'testId', // testId 데이터 업데이트
          workServerId: 'workServerId',
          createUserId: 'createUserId',
          createUserName: 'tester',
          updateDate: '20240120',
          title: 'update title',
          content: 'update content',
          reactions: []));
      // 데이터 업데이트 확인
      final report =
          controller.myReports.where((report) => report.serverId == 'testId');
      expect(report.first.title, 'update title');
    });

    test('delete Report', () async {
      final deleteReport = controller.myReports
          .where((report) => report.serverId == 'testId')
          .first;
      await controller.deleteReport(deleteReport);
      
      // 데이터 삭제 확인
      final findReport = controller.myReports
          .where((report) => report.serverId == 'testId')
          .isEmpty;
      expect(findReport, true);
    });
  });
}
