import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkDetailInvitedDialog extends StatelessWidget {
  const WorkDetailInvitedDialog({
    super.key,
    required this.inviteCode,
  });

  final String inviteCode;

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
                '초대코드',
                style: DesignSystem.typography.body(),
              ),
              const SizedBox(
                height: 34,
              ),
              SelectableText(
                inviteCode,
                style: DesignSystem.typography.display2(),
              ),
              const SizedBox(
                height: 48,
              ),
              Text(
                '해당 코드는 설정화면의\n작품 초대코드 입력을 통해 입력 가능합니다.',
                textAlign: TextAlign.center,
                style: DesignSystem.typography.caption1(TextStyle(
                    color: DesignSystem.colors.gray700,
                    fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                height: 1,
              ),
              InkWell(
                onTap: Get.back,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const Text('닫기'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
