import 'package:cow_cold/controllers/user_controller.dart';
import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/work/work.dart';
import 'package:cow_cold/view/widget/common/custom_flag_clip.dart';
import 'package:cow_cold/view/widget/common/shared_guide_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMainGridItem extends StatelessWidget {
  const HomeMainGridItem({
    super.key,
    required this.work,
  });

  final Work work;

  @override
  Widget build(BuildContext context) {
    final String userId = Get.find<UserController>().userId;
    final isMyWork = work.createUserId == userId;

    return GestureDetector(
      onTap: () {
        if (!isMyWork) {
          Get.find<ReportController>().loadInviteWorkReport(work);
        }
        Get.toNamed('/work_detail',
            arguments: {"work": work, "isMyWork": isMyWork});
      },
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            height: 130,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: DesignSystem.colors.background,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: DesignSystem.colors.gray700),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              work.title,
              maxLines: 4,
              style: DesignSystem.typography.title3(const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ClipPath(
                clipper: CustomFlagClip(),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  color: DesignSystem.colors.appSecondary,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      work.category,
                      textAlign: TextAlign.center,
                      style: DesignSystem.typography.body(TextStyle(
                          color: DesignSystem.colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                )),
          ),
          SharedGuideText(
            isMyReport: isMyWork,
            text: '초대 작품',
          )
        ],
      ),
    );
  }
}
