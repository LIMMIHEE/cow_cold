import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    this.child,
    this.text = '',
    required this.selectCategory,
    required this.onTap,
  });

  final String text;
  final String selectCategory;
  final Widget? child;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelectCategory = selectCategory == text;
    return ChoiceChip(
      label: child ??
          Text(text,
              style: DesignSystem.typography.title3(TextStyle(
                  color: isSelectCategory
                      ? DesignSystem.colors.white
                      : DesignSystem.colors.textPrimary,
                  fontWeight: FontWeight.w500))),
      selected: isSelectCategory,
      shape: StadiumBorder(
        side: BorderSide(
          width: 1,
          color: Colors.black.withOpacity(0.3),
        ),
      ),
      selectedColor: DesignSystem.colors.appPrimary,
      onSelected: (_) => onTap(text),
      backgroundColor: isSelectCategory
          ? DesignSystem.colors.appPrimary
          : Colors.transparent,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
    );
  }
}
