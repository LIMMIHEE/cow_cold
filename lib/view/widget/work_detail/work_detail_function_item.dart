import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class WorkDetailFunctionItem extends StatelessWidget {
  const WorkDetailFunctionItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isDeleteField = false,
  });

  final IconData icon;
  final String text;
  final Function() onTap;
  final bool isDeleteField;

  @override
  Widget build(BuildContext context) {
    final color = isDeleteField ? DesignSystem.colors.deleteRed : null;
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 18,
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Text(text,
                  style: DesignSystem.typography.body(
                      TextStyle(color: color, fontWeight: FontWeight.w400))),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
