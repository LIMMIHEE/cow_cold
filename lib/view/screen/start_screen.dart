import 'package:cow_cold/config/app_routes.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/screen/sign_in_screen.dart';
import 'package:cow_cold/view/screen/sign_up_screen.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/app_icon.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BottomButton(
              text: '회원가입',
              backgroundColor: DesignSystem.colors.mainColor,
              textColor: DesignSystem.colors.white,
              onTap: () {
                Get.toNamed('/signup');
              },
            ),
            BottomButton(
              text: '로그인',
              backgroundColor: DesignSystem.colors.white,
              textColor: DesignSystem.colors.textPrimary,
              onTap: () {
                Get.toNamed('/signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}
