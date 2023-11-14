import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/view/widget/common/custom_flag_clip.dart';
import 'package:flutter/material.dart';

class HomeMainGridItem extends StatelessWidget {
  const HomeMainGridItem({
    super.key,
    required this.work,
  });

  final Work work;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            height: 130,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: Colors.white,
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
          )
        ],
      ),
    );
  }
}
