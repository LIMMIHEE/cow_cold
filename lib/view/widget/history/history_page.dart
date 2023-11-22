import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/view/widget/common/app_logo.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/history/history_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<ReportController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
      child: Column(
        children: [
          const AppLogo(),
          const SizedBox(
            height: 30,
          ),
          Obx(() => MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                itemCount: controller.reportList.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final report = controller.reportList.elementAt(index);

                  return HistoryGridItem(report: report);
                },
              ))
        ],
      ),
    )));
  }
}
