import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/user_controller.dart';
import 'package:cow_cold/data/source/network/network_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaffoldBody extends GetView<UserController> {
  const ScaffoldBody({
    super.key,
    required this.child,
    this.appBar,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(
            () {
              final networkStatus = controller.deviceNetwork.value;
              return Visibility(
                visible: networkStatus == NetworkStatus.offLine,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.signal_wifi_connected_no_internet_4_rounded,
                          color: DesignSystem.colors.gray300,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '현재 오프라인 상태입니다.',
                          style: DesignSystem.typography.body2(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: DesignSystem.colors.gray300,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Divider(
                      height: 1,
                      color: DesignSystem.colors.gray100,
                    )
                  ],
                ),
              );
            },
          ),
          Expanded(child: child),
        ],
      )),
    );
  }
}
