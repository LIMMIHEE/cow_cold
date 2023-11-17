import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChipItem extends StatelessWidget {
  const ChipItem({
    super.key,
    this.child,
    this.text = '',
    this.backgroundColor,
    required this.selectText,
    required this.onTap,
  });

  final String text;
  final String selectText;
  final Widget? child;
  final Function(String) onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isSelectText = selectText == text;
    return ChoiceChip(
      label: child ??
          Text(text,
              style: DesignSystem.typography.title3(TextStyle(
                  color: isSelectText || backgroundColor != null
                      ? DesignSystem.colors.white
                      : DesignSystem.colors.textPrimary,
                  fontWeight: FontWeight.w500))),
      selected: isSelectText,
      shape: StadiumBorder(
        side: BorderSide(
          width: 1,
          color: (backgroundColor != null
                  ? DesignSystem.colors.white
                  : Colors.black)
              .withOpacity(0.3),
        ),
      ),
      selectedColor: DesignSystem.colors.appPrimary,
      onSelected: (_) => onTap(text),
      backgroundColor: isSelectText
          ? DesignSystem.colors.white
          : backgroundColor ?? Colors.transparent,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
    );
  }
}
