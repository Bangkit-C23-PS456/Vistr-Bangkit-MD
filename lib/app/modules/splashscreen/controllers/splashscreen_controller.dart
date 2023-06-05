import 'dart:async';

import 'package:get/get.dart';
import 'package:vistr/app/modules/onboarding/views/onboarding_view.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(milliseconds: 2000), () {
      Get.offAll(OnboardingView());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
