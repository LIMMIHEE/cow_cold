import 'package:cow_cold/view/widget/common/basic_app_bar.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBody(
        appBar: basicAppBar('로그인'),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ));
  }
}
