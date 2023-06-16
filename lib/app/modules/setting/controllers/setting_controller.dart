import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vistr/app/modules/onboarding/views/onboarding_view.dart';

import '../../../data/app_theme.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController

  RxBool selected = false.obs;
  RxBool enabled = true.obs;

  var dataProfile;
  RxBool isDataProfileIsExist = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logOut(context) async {
    Get.defaultDialog(
        title: "Log Out?",
        middleText: "Anda yakin ingin melakukan logout?",
        textConfirm: "Iya",
        textCancel: "Tidak",
        cancelTextColor: AppMainTheme.error,
        confirmTextColor: Colors.white,
        buttonColor: AppMainTheme.redPrimary,
        barrierDismissible: false,
        radius: 8,
        onConfirm: () async {
          Get.back();
          print("logout");
          box.remove('isUserExist');
          print("Is User Exist : ${box.read('isUserExist')}");
          box.remove('isPrefExist');
          print("Is Pref Exist : ${box.read('isPrefExist')}");
          box.remove('userToken');
          print("User Token : ${box.read('userToken')}");
          box.remove('userRole');
          print("User Role : ${box.read('userRole')}");
          box.remove('userData');
          print("User Data : ${box.read('userData')}");
          Get.offAll(OnboardingView());

          AppMainTheme.showSnackBar(context,
              title: "Berhasil Keluar",
              desc: "Comeback fasttt.",
              icon: Icons.logout,
              iconColor: AppMainTheme.bluePrimary);
        });
  }

  getDataProfile() async {
    print("User Token : ${box.read('userToken')} ");
    print("User Exist ?  : ${box.read('isUserExist')} ");

    try {
      print("get data profile");
      var response = await Dio().get(
        "https://vistr-capstone.et.r.appspot.com/user/get-user-profile",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {"token": "${box.read('userToken')}"}),
      );
      var statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        print("Response Get List Data Places: ${response.data}");
        dataProfile = response.data["data"];
        isDataProfileIsExist = true.obs;
        print(dataProfile);
        update();
      } else if (statusCode == 401) {
        // Get.offAll(() => LoginView());
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Sesi anda telah habis.')),
        // );
      } else {
        // print(response);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Ada masalah!')),
        // );
      }
    } catch (e) {
      print(e);
    }
  }
}
