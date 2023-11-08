import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget basicAppBar(String title, {Function? onTap}) {
  return AppBar(
    title: Text(
      title,
      style: DesignSystem.typography.body(),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () {
          onTap == null ? Get.back() : onTap();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: DesignSystem.colors.textPrimary,
          size: 20,
        )),
  );
}
