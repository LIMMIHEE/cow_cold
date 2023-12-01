import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialogButton extends StatelessWidget {
  const CommonDialogButton({
    super.key,
    required this.title,
    this.isLeftButton = true,
    this.confirmAction,
  });

  final String title;
  final bool isLeftButton;
  final Function()? confirmAction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: confirmAction ?? Get.back,
        borderRadius: BorderRadius.only(
            bottomLeft: isLeftButton ? const Radius.circular(16) : Radius.zero,
            bottomRight:
                !isLeftButton ? const Radius.circular(16) : Radius.zero),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
