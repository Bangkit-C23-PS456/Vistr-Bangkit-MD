import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vistr/app/modules/home/views/home_view.dart';
import 'package:vistr/app/modules/onboarding/views/onboarding_view.dart';
import 'package:vistr/app/modules/pref/views/pref_view.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  var box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkAuth() {
    if (box.read("isUserExist") != null) {
      if (box.read("isUserExist")) {
        if (box.read("isPrefExist") != null) {
          Timer(Duration(milliseconds: 2000), () {
            Get.offAll(HomeView());
          });
        } else {
          Timer(Duration(milliseconds: 2000), () {
            Get.offAll(PrefView());
          });
        }
      } else {
        Timer(Duration(milliseconds: 2000), () {
          Get.offAll(OnboardingView());
        });
      }
    } else {
      Timer(Duration(milliseconds: 2000), () {
        Get.offAll(OnboardingView());
      });
    }
  }
}
