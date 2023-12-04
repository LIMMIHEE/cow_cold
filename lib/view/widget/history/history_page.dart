import 'package:cow_cold/config/design_system/design_system.dart';
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
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          const AppLogo(),
          const SizedBox(
            height: 30,
          ),
          Obx(() {
            final myReports = controller.myReports;
            if (myReports.isEmpty) {
              return Expanded(
                child: Center(
                  child: Text(
                    '감상이 비어있습니다!',
                    style: DesignSystem.typography.body2(TextStyle(
                        color: DesignSystem.colors.gray700,
                        fontWeight: FontWeight.w400)),
                  ),
                ),
              );
            }

            return MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 20,
              shrinkWrap: true,
              itemCount: myReports.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final report = myReports.elementAt(index);

                return HistoryGridItem(report: report);
              },
            );
          })
        ],
      ),
    ));
  }
}
