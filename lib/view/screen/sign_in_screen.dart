import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/sign_in_controller.dart';
import 'package:cow_cold/view/widget/common/basic_app_bar.dart';
import 'package:cow_cold/view/widget/common/basic_text_field.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/common/sign_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        appBar: basicAppBar('로그인'),
        child: SafeArea(
          child: GetX<SignInController>(
              init: SignInController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SignTextField(
                              title: '아이디',
                              textField: BasicTextField(
                                hintText: '아이디 입력 (이메일)',
                                controller: controller.email,
                                onChanged: (_) => controller.dataEnteredCheck(),
                              ),
                            ),
                            SignTextField(
                              title: '비밀번호',
                              textField: BasicTextField(
                                hintText: '비밀번호 입력',
                                controller: controller.password,
                                isPassword: true,
                                onChanged: (_) => controller.dataEnteredCheck(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomButton(
                        text: '로그인',
                        backgroundColor: controller.isDataEntered.value
                            ? DesignSystem.colors.appPrimary
                            : DesignSystem.colors.gray100,
                        textColor: DesignSystem.colors.white,
                        onTap: () {
                          if (controller.isDataEntered.value) {
                            controller.loginUser();
                          }
                        })
                  ],
                );
              }),
        ));
  }
}
