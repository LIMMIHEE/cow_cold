import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/speech_text_bootom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeechTextButton extends StatelessWidget {
  const SpeechTextButton({
    super.key,
    required this.speechComplete,
  });

  final Function(String) speechComplete;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      child: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
              isScrollControlled: true,
              SpeechTextBottomSheet(
                speechComplete: speechComplete,
              ),
              backgroundColor: DesignSystem.colors.white);
        },
        elevation: 1,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: DesignSystem.colors.appSecondary),
            borderRadius: BorderRadius.circular(100)),
        backgroundColor: DesignSystem.colors.white,
        label: Text(
          '음성인식으로 입력하기',
          style: DesignSystem.typography.title3(TextStyle(
              fontWeight: FontWeight.w600,
              color: DesignSystem.colors.appSecondary)),
        ),
      ),
    );
  }
}
