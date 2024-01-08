import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/data/models/report/report.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryBottomSheet extends StatelessWidget {
  const HistoryBottomSheet({
    super.key,
    required this.report,
  });

  final Report report;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      report.title,
                      style: DesignSystem.typography.heading3(),
                    ),
                    Text(
                      DateFormat.yMMMd('ko').format(DateTime.now()),
                      style: DesignSystem.typography.body2(TextStyle(
                          color: DesignSystem.colors.gray700,
                          fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        report.content,
                        style: DesignSystem.typography.body(),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: double.infinity,
            child: BottomButton(
              text: '작품 상세 이동',
              backgroundColor: DesignSystem.colors.appPrimary,
              textColor: DesignSystem.colors.white,
              onTap: () {
                final work = Get.find<WorkController>()
                    .workList
                    .where((work) => work.serverId == report.workServerId)
                    .first;
                Get.back();
                Future.delayed(const Duration(milliseconds: 50), () {
                  Get.toNamed('/work_detail',
                      arguments: {"work": work, "isMyWork": true});
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
