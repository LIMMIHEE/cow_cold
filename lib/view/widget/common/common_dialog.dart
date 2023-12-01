import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/common_dialog_button.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    required this.title,
    required this.subText,
    this.confirmAction,
  });

  final String title;
  final String subText;
  final Function()? confirmAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      backgroundColor: DesignSystem.colors.white,
      child: Wrap(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              Text(
                title,
                style: DesignSystem.typography.heading3(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subText,
                textAlign: TextAlign.center,
                style: DesignSystem.typography.body(),
              ),
              const SizedBox(
                height: 36,
              ),
              const Divider(
                height: 1,
              ),
              Row(
                children: [
                  const CommonDialogButton(
                    title: '닫기',
                  ),
                  CommonDialogButton(
                      title: '확인',
                      isLeftButton: false,
                      confirmAction: confirmAction),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
