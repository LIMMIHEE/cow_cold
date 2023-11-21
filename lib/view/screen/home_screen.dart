import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/home_main_controller.dart';
import 'package:cow_cold/controllers/report_history_controller.dart';
import 'package:cow_cold/view/home_main/home_main_page.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/home/bottom_tab_item.dart';
import 'package:cow_cold/view/widget/history/history_page.dart';
import 'package:cow_cold/view/widget/home/write_pop_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<Widget> pages = [
    const HomeMainPage(),
    const HistoryPage(),
    Container(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put<HomeMainController>(
      HomeMainController(),
    );
    Get.put<ReportHistoryController>(
      ReportHistoryController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: HomeScreen.pages.elementAt(selectIndex),
            ),
            Container(
              color: DesignSystem.colors.black,
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: sortBottomTab(),
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
                                const BoxConstraints.tightFor(width: 94),
                            onSelected: (value) {
                              Get.toNamed('/$value');
                            },
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      padding: EdgeInsets.zero,
                                      value: 'write_report',
                                      child: WritePopMenuItem(
                                        text: '감상\n추가',
                                        backgroundColor:
                                            DesignSystem.colors.appPrimary,
                                        isLast: false,
                                      )),
                                  PopupMenuItem(
                                      padding: EdgeInsets.zero,
                                      value: 'write_work',
                                      child: WritePopMenuItem(
                                        text: '작품\n추가',
                                        backgroundColor:
                                            DesignSystem.colors.appSecondary,
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
    ));
  }

  void selectTab(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  List<Widget> sortBottomTab() {
    final bottomTabs = [
      Positioned(
        right: 0,
        child: BottomTabItem(
          icon: Icons.settings,
          tabIndex: 2,
          selectIndex: selectIndex,
          onTap: selectTab,
        ),
      ),
      BottomTabItem(
        icon: Icons.bookmark,
        tabIndex: 1,
        selectIndex: selectIndex,
        onTap: selectTab,
      ),
      Positioned(
        left: 0,
        child: BottomTabItem(
          icon: Icons.home_rounded,
          tabIndex: 0,
          selectIndex: selectIndex,
          onTap: selectTab,
        ),
      )
    ];
    return [
      bottomTabs.elementAt(selectIndex == 1 ? 2 : selectIndex),
      bottomTabs.elementAt((1 - selectIndex).abs()),
      bottomTabs.elementAt(2 - selectIndex),
    ];
  }
}
