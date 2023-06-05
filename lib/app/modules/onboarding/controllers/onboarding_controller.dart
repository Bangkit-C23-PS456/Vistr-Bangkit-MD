import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement OnboardingController

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Onboarding 1'),
    new Tab(text: 'Onboarding 2'),
    new Tab(text: 'Onboarding 3'),
  ];

  late TabController tabController;
  RxInt tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
