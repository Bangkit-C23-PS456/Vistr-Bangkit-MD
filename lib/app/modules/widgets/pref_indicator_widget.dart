import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vistr/app/data/app_theme.dart';

class OnboardingIndicatorWidget extends StatelessWidget {
  TabController tabController;
  RxInt tabIndex = 0.obs;
  OnboardingIndicatorWidget(
      {required this.tabController, required this.tabIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tabIndex.value != null
          ? Stack(children: [
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppMainTheme.bluePrimary,
                      borderRadius: BorderRadius.circular(10)),
                  height: 10,
                  width: tabIndex.value == 0
                      ? (MediaQuery.sizeOf(context).width - 40) / 3
                      : tabIndex.value == 1
                          ? (MediaQuery.sizeOf(context).width - 40) / 2
                          : MediaQuery.sizeOf(context).width - 40,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () => tabController.index = 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppMainTheme.bluePrimary,
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () => tabController.index = 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabIndex.value == 1 || tabIndex.value == 2
                              ? AppMainTheme.bluePrimary
                              : Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () => tabController.index = 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabIndex.value == 2
                              ? AppMainTheme.bluePrimary
                              : Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10)),
                      height: 10,
                    ),
                  ))
                ],
              ),
            ])
          : Container(),
    );
  }
}
