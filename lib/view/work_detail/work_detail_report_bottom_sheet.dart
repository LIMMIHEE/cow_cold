import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/common/utils.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WorkDetailReportBottomSheet extends StatelessWidget {
  const WorkDetailReportBottomSheet({
    super.key,
    required this.report,
    required this.isMyReport,
  });

  final Report report;
  final bool isMyReport;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
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
          Visibility(
            visible: isMyReport,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                      child: BottomButton(
                          text: '감상 삭제',
                          backgroundColor: DesignSystem.colors.deleteRed,
                          textColor: DesignSystem.colors.white,
                          onTap: () {
                            if (report.createUserId !=
                                PrefsUtils.getString(PrefsUtils.userId)) {
                              Get.snackbar('삭제 불가', '내가 작성한 감상이 아닙니다.');
                              return;
                            }

                            Get.back();
                            Utils.utils.defaultDialog(
                              '감상 삭제하기',
                              '정말 감상을 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다.',
                              onCancel: () {
                                Get.back();
                                Future.delayed(const Duration(milliseconds: 50),
                                    () {
                                  Get.find<ReportController>()
                                      .deleteReport(report);
                                });
                              },
                            );
                          },
                          paddingVisible: false)),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: BottomButton(
                          text: '감상 수정',
                          backgroundColor: DesignSystem.colors.appSecondary,
                          textColor: DesignSystem.colors.white,
                          onTap: () {
                            Get.back();
                            Get.toNamed(
                              '/write_report',
                              arguments: {
                                "initialWorkId": report.workServerId,
                                "initialReport": report
                              },
                            );
                          },
                          paddingVisible: false)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
