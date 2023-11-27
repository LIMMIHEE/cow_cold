import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/view/widget/common/custom_flag_clip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkDetailInfoColumn extends GetView<WorkController> {
  const WorkDetailInfoColumn({super.key, required this.workServerId});

  final String workServerId;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final work = controller.workList
          .firstWhere((work) => work.serverId == workServerId);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  work.title,
                  style: DesignSystem.typography.heading3(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ClipPath(
                    clipper: CustomFlagClip(),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 110),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                          color: DesignSystem.colors.appSecondary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          work.category,
                          textAlign: TextAlign.center,
                          style: DesignSystem.typography.body(TextStyle(
                              color: DesignSystem.colors.white,
                              fontWeight: FontWeight.w400)),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              work.description,
              style: DesignSystem.typography.body(TextStyle(
                  color: DesignSystem.colors.gray700,
                  fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      );
    });
  }
}
