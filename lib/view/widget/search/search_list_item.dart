import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/view/widget/search/search_flag_clip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({
    super.key,
    required this.work,
  });
  final Work work;

  @override
  Widget build(BuildContext context) {
    final String userId = PrefsUtils.getString(PrefsUtils.userId);
    final isMyWork = work.createUserId == userId;

    return GestureDetector(
      onTap: () {
        Get.toNamed('/work_detail',
            arguments: {"work": work, "isMyWork": isMyWork});
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              work.title,
              maxLines: 2,
              style: DesignSystem.typography.title1(const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 12,
            ),
            ClipPath(
                clipper: SearchFlagClip(),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: DesignSystem.colors.appSecondary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        work.category,
                        style: DesignSystem.typography.body(TextStyle(
                            color: DesignSystem.colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 55, top: 8),
                        child: Text(
                          work.description,
                          maxLines: 2,
                          style: DesignSystem.typography.body(TextStyle(
                              color: DesignSystem.colors.white,
                              overflow: TextOverflow.ellipsis,
                              letterSpacing: 0.4,
                              fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
