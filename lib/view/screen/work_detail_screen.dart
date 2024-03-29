import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/work/work.dart';
import 'package:cow_cold/view/widget/common/basic_app_bar.dart';
import 'package:cow_cold/view/widget/common/common_dialog.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/work_detail/board_top_layout.dart';
import 'package:cow_cold/view/widget/work_detail/work_detail_function_item.dart';
import 'package:cow_cold/view/widget/work_detail/work_detail_grid_item.dart';
import 'package:cow_cold/view/widget/work_detail/work_detail_info_column.dart';
import 'package:cow_cold/view/widget/work_detail/work_detail_invited_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class WorkDetailScreen extends GetView<ReportController> {
  const WorkDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final work = Get.arguments["work"] as Work;
    final isMyWork = Get.arguments["isMyWork"] as bool;

    return ScaffoldBody(
        appBar: basicAppBar('작품상세',
            actions: isMyWork
                ? [
                    IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                              Wrap(
                                children: [
                                  WorkDetailFunctionItem(
                                    icon: Icons.edit,
                                    text: '수정',
                                    onTap: () {
                                      Get.back();
                                      Get.toNamed('/write_work',
                                          arguments: work);
                                    },
                                  ),
                                  WorkDetailFunctionItem(
                                    icon: Icons.share,
                                    text: '공동 작성자 초대코드',
                                    onTap: () {
                                      Get.back();
                                      Get.dialog(WorkDetailInvitedDialog(
                                          inviteCode: work.inviteCode));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 120,
                                  ),
                                  WorkDetailFunctionItem(
                                    icon: Icons.delete,
                                    text: '삭제',
                                    isDeleteField: true,
                                    onTap: () {
                                      Get.back();
                                      Get.dialog(CommonDialog(
                                        title: '작품 삭제하기',
                                        subText:
                                            '작품을 삭제하시겠습니까?\n감상 내역들이 함께 사라집니다.',
                                        confirmAction: () {
                                          Get.back();
                                          Get.find<WorkController>()
                                              .removeWork(work);
                                        },
                                      ));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                ],
                              ),
                              backgroundColor: DesignSystem.colors.background);
                        },
                        icon: const Icon(
                          Icons.more_vert,
                        ))
                  ]
                : null),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              WorkDetailInfoColumn(workServerId: work.serverId),
              const BoardTopLayout(),
              Expanded(child: Obx(() {
                final reports = [
                  ...controller.getWorkReport(work.serverId),
                  ...controller.getInviteWorkReport(work.serverId) ?? []
                ];
                return Stack(
                  children: [
                    Container(
                      height: reports.length > 3
                          ? (reports.length > 5 ? 400 : reports.length * 50)
                          : 0,
                      color: DesignSystem.colors.appPrimary,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 25, left: 25, right: 25),
                        decoration: BoxDecoration(
                            color: DesignSystem.colors.appPrimary,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/write_report',
                                  arguments: {"initialWorkId": work.serverId},
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 12),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: ShapeDecoration(
                                  color: DesignSystem.colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1,
                                        color: DesignSystem.colors.black
                                            .withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  '감상추가',
                                  textAlign: TextAlign.center,
                                  style: DesignSystem.typography.body(TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: DesignSystem.colors.black)),
                                ),
                              ),
                            ),
                            MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              shrinkWrap: true,
                              itemCount: reports.length,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final report = reports.elementAt(index);

                                return WorkDetailGridItem(report: report);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }))
            ],
          ),
        ));
  }
}
