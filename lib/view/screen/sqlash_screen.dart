import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        child: Center(
      child: SvgPicture.asset(
        'assets/images/app_icon.svg',
        fit: BoxFit.cover,
      ),
    ));
  }
}
