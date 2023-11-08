import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/sign_up_controller.dart';
import 'package:cow_cold/view/widget/common/basic_app_bar.dart';
import 'package:cow_cold/view/widget/common/basic_text_field.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/common/sign_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        appBar: basicAppBar('회원가입'),
        child: SafeArea(
          child: GetBuilder<SignUpController>(
            init: SignUpController(),
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
                          Row(
                            children: [
                              Expanded(
                                  child: SignTextField(
                                title: '아이디',
                                textField: BasicTextField(
                                  hintText: '아이디 입력 (이메일)',
                                  controller: controller.email,
                                  onChanged: (_) =>
                                      controller.dataEnteredCheck(),
                                ),
                              )),
                              GestureDetector(
                                onTap: () {
                                  controller.duplicateEmailCheck();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 22),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: ShapeDecoration(
                                    color: DesignSystem.colors.appPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  child: Text('중복확인',
                                      style: DesignSystem.typography.body2(
                                          TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  DesignSystem.colors.white))),
                                ),
                              )
                            ],
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
                          SignTextField(
                            title: '별명',
                            textField: BasicTextField(
                              hintText: '별명 입력',
                              controller: controller.nickName,
                              onChanged: (_) => controller.dataEnteredCheck(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomButton(
                      text: '회원가입',
                      backgroundColor: controller.isDataEntered
                          ? DesignSystem.colors.appPrimary
                          : DesignSystem.colors.gray100,
                      textColor: DesignSystem.colors.white,
                      onTap: () {
                        controller.dataFormatCheck();

                        if (controller.isDataEntered &&
                            controller.isDataFormatCondition) {
                          controller.registerUser();
                        }
                      })
                ],
              );
            },
          ),
        ));
  }
}
