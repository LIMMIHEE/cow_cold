import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/view/widget/common/app_logo.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/home/home_main/home_main_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMainPage extends GetView<WorkController> {
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
              const Expanded(
                child: AppLogo(),
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
        Obx(() {
          final workList = controller.workList;
          return Expanded(
            child: controller.isGetWorkData && workList.isEmpty
                ? Center(
                    child: Text(
                      '감상 중인 작품을 추가해주세요!',
                      style: DesignSystem.typography.body2(TextStyle(
                          color: DesignSystem.colors.gray700,
                          fontWeight: FontWeight.w400)),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.9 / 3,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      itemCount: workList.length,
                      itemBuilder: (context, index) {
                        final work = workList.elementAt(index);

                        return HomeMainGridItem(work: work);
                      },
                    ),
                  ),
          );
        })
      ],
    )));
  }
}
