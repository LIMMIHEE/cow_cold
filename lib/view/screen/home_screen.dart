import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/home_controller.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/home/bottom_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<Widget> pages = [
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: GetX<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Column(
                children: [
                  Expanded(
                    child: pages.elementAt(controller.selectIndex.value),
                  ),
                  Container(
                    color: DesignSystem.colors.black,
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: sortBottomTab(controller),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: IconButton(
                              onPressed: () {},
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.edit,
                                  color: DesignSystem.colors.white,
                                  size: 28,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }

  List<Widget> sortBottomTab(HomeController controller) {
    final bottomTabs = [
      Positioned(
        right: 0,
        child: BottomTabItem(
          icon: Icons.settings,
          tabIndex: 2,
          controller: controller,
        ),
      ),
      BottomTabItem(
        icon: Icons.bookmark,
        tabIndex: 1,
        controller: controller,
      ),
      Positioned(
        left: 0,
        child: BottomTabItem(
          icon: Icons.home_rounded,
          tabIndex: 0,
          controller: controller,
        ),
      )
    ];
    return [
      bottomTabs.elementAt(
          controller.selectIndex.value == 1 ? 2 : controller.selectIndex.value),
      bottomTabs.elementAt((1 - controller.selectIndex.value).abs()),
      bottomTabs.elementAt(2 - controller.selectIndex.value),
    ];
  }
}
