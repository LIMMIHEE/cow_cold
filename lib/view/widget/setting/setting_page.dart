import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/config/design_system/app_theme.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/user_controller.dart';
import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/view/widget/common/common_dialog.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/common/text_field_bottom_sheet.dart';
import 'package:cow_cold/view/widget/setting/dark_mode_switch.dart';
import 'package:cow_cold/view/widget/setting/setting_row.dart';
import 'package:cow_cold/view/widget/setting/setting_row_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            Prefs.getString(Prefs.nickName),
            style: DesignSystem.typography.heading1(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SettingRow(
          title: '다크모드',
          widget: DarkModeSwitch(),
        ),
        SettingRowButton(
          title: '작품 초대코드 입력',
          iconData: Icons.arrow_forward_ios_rounded,
          onTap: () {
            Get.bottomSheet(
                TextFieldBottomSheet(
                  title: '초대코드',
                  hintText: '초대코드를 입력해주세요.',
                  buttonText: '확인',
                  onTap: (text) {
                    Get.back();
                    Get.find<WorkController>().submitInviteCode(text);
                  },
                ),
                backgroundColor: DesignSystem.colors.background);
          },
        ),
        SettingRowButton(
          title: '로그아웃',
          iconData: Icons.arrow_forward_ios_rounded,
          onTap: () {
            Get.dialog(CommonDialog(
              title: '로그아웃',
              subText: '정말 로그아웃 하시겠습니까?',
              confirmAction: () {
                Get.find<UserController>().userLogout();
              },
            ));
          },
        ),
        const SizedBox(
          height: 120,
        ),
        Divider(
          thickness: 10,
          color: DesignSystem.colors.divider.withOpacity(0.3),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: TextButton(
              onPressed: () {
                Get.dialog(CommonDialog(
                  title: '회원탈퇴',
                  subText: '탈퇴 시 모든 계정 정보가 삭제됩니다.\n정말 회원탈퇴 하시겠습니까? ',
                  confirmAction: () {
                    Get.find<UserController>().unregisterUser();
                  },
                ));
              },
              child: Text('회원탈퇴',
                  style: DesignSystem.typography.caption1(TextStyle(
                      color: DesignSystem.colors.gray300,
                      fontWeight: FontWeight.w400)))),
        )
      ],
    ));
  }
}
