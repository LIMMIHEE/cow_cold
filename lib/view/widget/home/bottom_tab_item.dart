import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/home/custom_bottom_clip.dart';
import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  const BottomTabItem({
    super.key,
    required this.icon,
    required this.tabIndex,
    required this.selectIndex,
    required this.onTap,
  });

  final IconData icon;
  final int tabIndex;
  final int selectIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelectTab = selectIndex == tabIndex;
    return ClipPath(
        clipper: CustomBottomClip(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          color: isSelectTab
              ? DesignSystem.colors.white
              : ((tabIndex - selectIndex).abs() > 1
                  ? DesignSystem.colors.gray700
                  : DesignSystem.colors.gray100),
          child: IconButton(
              onPressed: () => onTap(tabIndex),
              icon: Icon(icon,
                  color: isSelectTab
                      ? DesignSystem.colors.appPrimary
                      : DesignSystem.colors.black)),
        ));
  }
}
