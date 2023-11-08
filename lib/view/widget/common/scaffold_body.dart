import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBar,
  });

  final Widget child;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? DesignSystem.colors.white,
      body: child,
    );
  }
}
