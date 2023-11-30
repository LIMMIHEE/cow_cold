import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/view/widget/history/history_border_painter.dart';
import 'package:cow_cold/view/widget/history/history_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryGridItem extends StatelessWidget {
  const HistoryGridItem({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(HistoryBottomSheet(report: report),
            backgroundColor: DesignSystem.colors.white);
      },
      child: Column(
        children: [
          CustomPaint(
              painter: HistoryBorderPainter(),
              child: ClipPath(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              DateFormat.MMMd('ko')
                                  .format(DateTime.parse(report.updateDate)),
                              style: DesignSystem.typography.body2(TextStyle(
                                  color: DesignSystem.colors.gray700,
                                  fontWeight: FontWeight.w400)),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: DesignSystem.colors.gray700,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            report.content,
                            textAlign: TextAlign.start,
                            maxLines: 7,
                            style: DesignSystem.typography.body(const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
