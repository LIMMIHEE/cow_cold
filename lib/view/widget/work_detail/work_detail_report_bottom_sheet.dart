import 'dart:io';

import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/reactions/reaction.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:cow_cold/view/widget/common/chip_item.dart';
import 'package:cow_cold/view/widget/common/common_dialog.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WorkDetailReportBottomSheet extends GetView<ReportController> {
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
      child: SizedBox(
        width: double.infinity,
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
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      const SizedBox(width: 25),
                      ...[
                        Reaction(
                            emoji: '😃',
                            reactionUsers: [],
                            serverId: 'serverId')
                      ].map((reaction) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChipItem(
                              text:
                                  '${reaction.emoji}  ${reaction.reactionUsers.length}',
                              onTap: (_) {},
                              selectText: '',
                            ),
                          )),
                      Visibility(
                          visible: !isMyReport,
                          child: ChipItem(
                            selectText: 'none',
                            onTap: (_) {
                              controller.setEmojiKeyboardShowing(true);
                            },
                            child: const Icon(
                              Icons.add,
                              size: 18,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Visibility(
                    visible: controller.emojiKeyboardShowing.value,
                    child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          controller.setEmojiKeyboardShowing(false);
                        },
                        config: Config(
                          columns: 7,
                          emojiSizeMax: 24 * (Platform.isIOS ? 1.3 : 1.0),
                          bgColor: DesignSystem.colors.appPrimary100,
                          iconColor: DesignSystem.colors.appPrimary,
                          indicatorColor: DesignSystem.colors.appSecondary,
                          iconColorSelected: DesignSystem.colors.appSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Visibility(
              visible: isMyReport,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                        child: BottomButton(
                            text: '감상 삭제',
                            backgroundColor: DesignSystem.colors.deleteRed,
                            textColor: DesignSystem.colors.white,
                            onTap: () {
                              Get.back();
                              Get.dialog(CommonDialog(
                                title: '감상 삭제하기',
                                subText: '정말 감상을 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다.',
                                confirmAction: () {
                                  Get.back();
                                  Future.delayed(
                                      const Duration(milliseconds: 50), () {
                                    Get.find<ReportController>()
                                        .deleteReport(report);
                                  });
                                },
                              ));
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
            ),
          ],
        ),
      ),
    );
  }
}
