import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      'assets/images/app_icon.svg',
                      width: 30,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed('/search');
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ))
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '감상 중인 작품을 추가해주세요!',
                style: DesignSystem.typography.body2(TextStyle(
                    color: DesignSystem.colors.gray700,
                    fontWeight: FontWeight.w400)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
