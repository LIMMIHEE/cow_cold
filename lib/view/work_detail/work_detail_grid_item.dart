import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkDetailGridItem extends StatelessWidget {
  const WorkDetailGridItem({
    super.key,
    required this.report,
  });

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          color: DesignSystem.colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 1, color: DesignSystem.colors.black.withOpacity(0.3))),
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
            height: 10,
          ),
          Text(report.content,
              maxLines: 7,
              style: DesignSystem.typography.body(const TextStyle(
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ))),
        ],
      ),
    );
  }
}
