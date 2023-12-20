import 'dart:io';

import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'chip_item.dart';

class ReportReactionChip extends GetView<ReportController> {
  const ReportReactionChip({
    super.key,
    required this.report,
    required this.isMyReport,
  });

  final Report report;
  final bool isMyReport;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                const SizedBox(width: 25),
                ...report.reactions.map((reaction) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChipItem(
                        text:
                            '${reaction.emoji}  ${reaction.reactionUsers.length}',
                        onTap: (_) {
                          controller.selectEmoji(report, reaction.emoji);
                          setState(() {});
                        },
                        selectText: reaction.reactionUsers
                                .contains(controller.userId)
                            ? '${reaction.emoji}  ${reaction.reactionUsers.length}'
                            : '',
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
                    controller.selectEmoji(report, emoji.emoji);
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
      });
    });
  }
}
