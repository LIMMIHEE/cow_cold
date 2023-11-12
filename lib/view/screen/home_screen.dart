import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/home_controller.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/home/bottom_tab_item.dart';
import 'package:cow_cold/view/widget/home/home_main_page.dart';
import 'package:cow_cold/view/widget/home/write_pop_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<Widget> pages = [
    const HomeMainPage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: GetX<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Stack(
                children: [
                  Column(
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
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                  ),
                                  child: PopupMenuButton(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      constraints:
                                          const BoxConstraints.tightFor(
                                              width: 94),
                                      onSelected: (value) {
                                        Get.toNamed('/$value');
                                      },
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                value: 'write_work',
                                                child: WritePopMenuItem(
                                                  text: '감상\n추가',
                                                  backgroundColor: DesignSystem
                                                      .colors.appPrimary,
                                                  isLast: false,
                                                )),
                                            PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                value: 'write_report',
                                                child: WritePopMenuItem(
                                                  text: '작품\n추가',
                                                  backgroundColor: DesignSystem
                                                      .colors.appSecondary,
                                                  isLast: true,
                                                )),
                                          ],
                                      icon: Icon(
                                        Icons.edit,
                                        color: DesignSystem.colors.white,
                                        size: 28,
                                      )),
                                ))
                          ],
                        ),
                      ),
                    ],
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
