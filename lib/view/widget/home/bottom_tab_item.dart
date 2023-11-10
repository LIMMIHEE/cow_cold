import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/home_controller.dart';
import 'package:cow_cold/view/widget/home/custom_bottom_clip.dart';
import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  const BottomTabItem(
      {super.key,
      required this.icon,
      required this.tabIndex,
      required this.controller});

  final IconData icon;
  final int tabIndex;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final isSelectTab = controller.selectIndex.value == tabIndex;
    return ClipPath(
        clipper: CustomBottomClip(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          color: isSelectTab
              ? DesignSystem.colors.white
              : ((tabIndex - controller.selectIndex.value).abs() > 1
                  ? DesignSystem.colors.gray700
                  : DesignSystem.colors.gray100),
          child: IconButton(
              onPressed: () {
                controller.changeTab(tabIndex);
              },
              icon: Icon(icon,
                  color: isSelectTab
                      ? DesignSystem.colors.appPrimary
                      : DesignSystem.colors.black)),
        ));
  }
}
