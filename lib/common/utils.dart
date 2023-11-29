import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static final Utils utils = Utils();

  void defaultDialog(String title, String subText,
      {Function()? onCancel, Function()? onConfirm}) {
    Get.defaultDialog(
        title: title,
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Text(
            subText,
            textAlign: TextAlign.center,
          ),
        ),
        textConfirm: '취소',
        confirmTextColor: Colors.white,
        onConfirm: onConfirm ?? Get.back,
        textCancel: '확인',
        onCancel: onCancel ?? Get.back,
        titlePadding: const EdgeInsets.symmetric(vertical: 12),
        cancelTextColor: DesignSystem.colors.appPrimary,
        radius: 16,
        buttonColor: DesignSystem.colors.appPrimary);
  }

  String speechToText() {
    return '';
  }
}
