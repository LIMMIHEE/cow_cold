import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SharedGuideText extends StatelessWidget {
  const SharedGuideText({
    super.key,
    required this.text,
    required this.isMyReport,
    this.topPadding = false,
  });

  final String text;
  final bool isMyReport;
  final bool topPadding;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isMyReport,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding ? 8 : 0),
        child: Center(
          child: Text(
            text,
            style: DesignSystem.typography.body2(TextStyle(
                color: DesignSystem.colors.gray300,
                fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
