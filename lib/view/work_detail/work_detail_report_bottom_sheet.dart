import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkDetailReportBottomSheet extends StatelessWidget {
  const WorkDetailReportBottomSheet({
    super.key,
    required this.report,
  });

  final Report report;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      DateFormat.yMMMd('ko').format(DateTime.now()),
                      style: DesignSystem.typography.body2(TextStyle(
                          color: DesignSystem.colors.gray700,
                          fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        report.content,
                        style: DesignSystem.typography.body(),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                    child: BottomButton(
                        text: '감상 삭제',
                        backgroundColor: DesignSystem.colors.deleteRed,
                        textColor: DesignSystem.colors.white,
                        onTap: () {},
                        paddingVisible: false)),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: BottomButton(
                        text: '감상 수정',
                        backgroundColor: DesignSystem.colors.appSecondary,
                        textColor: DesignSystem.colors.white,
                        onTap: () {},
                        paddingVisible: false)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
