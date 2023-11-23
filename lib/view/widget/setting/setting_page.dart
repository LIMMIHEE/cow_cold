import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/common/text_field_bottom_sheet.dart';
import 'package:cow_cold/view/widget/setting/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              PrefsUtils.getString(PrefsUtils.nickName),
              style: DesignSystem.typography.heading1(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SettingRow(
            title: '작품 초대코드 입력',
            iconData: Icons.arrow_forward_ios_rounded,
            onTap: () {
              Get.bottomSheet(
                  TextFieldBottomSheet(
                    title: '초대코드',
                    hintText: '초대코드를 입력해주세요.',
                    buttonText: '확인',
                    onTap: (text) {},
                  ),
                  backgroundColor: DesignSystem.colors.white);
            },
          )
        ],
      ),
    ));
  }
}
