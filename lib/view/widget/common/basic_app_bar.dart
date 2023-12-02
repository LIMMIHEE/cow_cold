import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget basicAppBar(String title,
    {Function? onTap, List<Widget>? actions}) {
  return AppBar(
    title: Text(
      title,
      style: DesignSystem.typography.body(),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: actions,
    leading: IconButton(
        onPressed: () {
          onTap == null ? Get.back() : onTap();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
        )),
  );
}
